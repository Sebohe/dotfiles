set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set ls=0
hi MatchParen cterm=underline ctermfg=magenta

" Configs
command WQ wq
command Wq wq
command W w
command Q q

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ff=unix
set autoread
set hlsearch

set number
set relativenumber

augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=500 ttimeoutlen=0

" Maintain undo history between sessions
set undofile 
set undodir=~/.vim/undodir

" Add spell check to markdown files
autocmd FileType markdown setlocal spell

" Source plugins
source ~/.config/nvim/plugins.vimrc
source ~/.config/nvim/deoplete.vimrc
