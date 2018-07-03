set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc
source ~/.config/nvim/deoplete.vimrc
source ~/.config/nvim/plugins.vimrc

set guicursor=
set ls=0

" Configs
command WQ wq
command Wq wq
command W w
command Q q

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ff=unix
set autoread
set hlsearch

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=500 ttimeoutlen=0

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

autocmd FileType markdown setlocal spell
