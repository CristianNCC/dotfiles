set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible
set autoindent
set smartindent

set tabstop=4      
set shiftwidth=4 

set textwidth=120

syntax on
set t_Co=256
set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */

set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

let g:clang_library_path='/usr/lib/llvm-14/lib/libclang-14.so.1'
let g:clang_user_options='|| exit 0'

map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
