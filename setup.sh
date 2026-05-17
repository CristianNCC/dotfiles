#!/usr/bin/env bash
# setup.sh — provision a fresh Fedora machine to my liking
set -euo pipefail


echo ">>> Updating system packages..."
sudo dnf upgrade --refresh -y


echo ">>> Updating firmware..."
sudo fwupdmgr refresh --force || true
sudo fwupdmgr update -y || true


echo ">>> Installing CLI tools..."
sudo dnf install -y eza ripgrep fzf


echo ">>> Configuring shell aliases..."
MARKER="# >>> my-setup aliases >>>"

if ! grep -qF "$MARKER" ~/.bashrc; then
    cat >> ~/.bashrc <<'EOF'

# >>> my-setup aliases >>>
alias ls='eza --group-directories-first'
alias ll='eza -lh --group-directories-first'
alias la='eza -lah --group-directories-first'
alias lt='eza --tree --level=2'
alias l='eza -1'
# <<< my-setup aliases <
EOF
    echo "    aliases added to ~/.bashrc"
else
    echo "    aliases already present, skipping"
fi


echo ">>> Configuring fzf shell integration..."
FZF_MARKER="# >>> fzf integration >>>"

if ! grep -qF "$FZF_MARKER" ~/.bashrc; then
    cat >> ~/.bashrc <<'EOF'

# >>> fzf integration >>>
[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash
[ -f /usr/share/fzf/shell/completion.bash ] && source /usr/share/fzf/shell/completion.bash
# <<< fzf integration <
EOF
    echo "    fzf integration added to ~/.bashrc"
else
    echo "    fzf integration already present, skipping"
fi


echo ">>> Installing C/C++ build toolchain..."
sudo dnf install -y @development-tools
sudo dnf install -y \
    gcc-c++ \
    glibc-devel \
    libstdc++-devel \
    cmake \
    ninja-build \
    pkgconf-pkg-config


echo ">>> Installing Vim and dependencies..."
sudo dnf install -y \
    vim-enhanced \
    nodejs \
    clang-tools-extra


echo ">>> Installing vim-plug..."
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "    vim-plug installed"
else
    echo "    vim-plug already present"
fi


echo ">>> Configuring Vim..."
if [ ! -f ~/.vimrc ]; then
    cat > ~/.vimrc <<'EOF'
" ---- Basic settings ----
syntax on
filetype plugin indent on

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=120

set number
set relativenumber
set cursorline
set showmatch
set visualbell
set scrolloff=5
set sidescrolloff=8
set wildmenu
set wildmode=longest:full,full
set hidden
set mouse=a
set clipboard=unnamedplus
set updatetime=300
set signcolumn=yes
set ambw=double

set ignorecase
set smartcase
set incsearch
set hlsearch

set undofile
set undodir=~/.vim/undo
silent! call mkdir(expand('~/.vim/undo'), 'p')


" ---- Plugins ----
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autocomplete (LSP)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File tree
Plug 'preservim/nerdtree'

" Editing helpers
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'

call plug#end()


" ---- Colorscheme (must come AFTER plug#end) ----
set termguicolors
set background=dark
silent! colorscheme gruvbox


" ---- Airline ----
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1


" ---- Keymaps ----
let mapleader = " "

" Clear search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" File tree toggle
nnoremap <leader>e :NERDTreeToggle<CR>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>b :Buffers<CR>

" Save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>


" ---- coc.nvim ----
" Use Tab for completion navigation
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Go-to navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)

" Show docs on K
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format
nmap <leader>F  <Plug>(coc-format)
EOF
    echo "    ~/.vimrc created"
    VIMRC_CREATED=1
else
    echo "    ~/.vimrc already exists, leaving it alone"
    VIMRC_CREATED=0
fi


echo ">>> Installing Vim plugins..."
if [ "${VIMRC_CREATED:-0}" = "1" ]; then
    vim +PlugInstall +qall
    echo "    plugins installed"
else
    echo "    skipping (existing .vimrc — run ':PlugInstall' manually if needed)"
fi


echo ">>> Installing coc.nvim language servers..."
COC_MARKER=~/.vim/.coc-installed
if [ ! -f "$COC_MARKER" ]; then
    vim +'CocInstall -sync coc-clangd coc-pyright coc-json coc-tsserver coc-sh' +qall
    touch "$COC_MARKER"
    echo "    language servers installed"
else
    echo "    language servers already installed, skipping"
fi


echo
echo "Done. Run 'source ~/.bashrc' or open a new terminal to pick up aliases."
