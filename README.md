# dotfiles

`setup.sh` provisions a fresh Fedora machine to my liking. It's idempotent — safe to re-run, it skips anything already configured.

## Usage

```bash
./setup.sh
```

## What it does

- Updates system packages (`dnf upgrade`) and firmware (`fwupdmgr`)
- Installs CLI tools: `eza`, `ripgrep`, `fzf`, `bat`
- Adds shell aliases to `~/.bashrc` (`ls`/`ll`/`la`/`lt`/`l` via `eza`, `cls` for clear, `cat` for `bat`)
- Adds fzf key-bindings/completion sourcing to `~/.bashrc`
- Adds ssh-agent auto-start to `~/.bashrc`, loading `~/.ssh/id_ed25519`
- Installs a C/C++ build toolchain: `@development-tools`, `gcc-c++`, `glibc-devel`, `libstdc++-devel`, `cmake`, `ninja-build`, `pkgconf-pkg-config`
- Installs C/C++ testing and sanitizer libraries: `gtest-devel`, `gmock-devel`, `libasan`, `libubsan`
- Installs Vim and dependencies: `vim-enhanced`, `nodejs`, `clang-tools-extra`
- Sets `git config --global core.editor vim`
- Installs `vim-plug` and writes `~/.vimrc` (only if one doesn't already exist)
- Installs the vim-plug plugins and coc.nvim language servers (`coc-clangd`, `coc-pyright`, `coc-json`, `coc-tsserver`, `coc-sh`)

## Vim setup

The generated `~/.vimrc` sets up:

- gruvbox colorscheme + vim-airline statusline
- coc.nvim for LSP-based autocomplete, go-to-definition, hover docs, rename, and formatting
- fzf.vim for fuzzy file/buffer/ripgrep search
- NERDTree file explorer
- Editing helpers: vim-surround, vim-commentary, vim-fugitive, vim-gitgutter, auto-pairs
- Leader key is `<space>`: `<leader>e` file tree, `<leader>f`/`<leader>g`/`<leader>b` fzf files/ripgrep/buffers, `<leader>w`/`<leader>q` save/quit, `<leader>rn` rename, `<leader>F` format

If `~/.vimrc` already exists, it's left untouched and plugin installation is skipped — run `:PlugInstall` manually if needed.

## Notes

- Targets Fedora (`dnf`-based).
- Re-running only fills in missing pieces — existing config blocks (marked with `# >>> ... >>>` / `# <<< ... <` comments) aren't duplicated.
