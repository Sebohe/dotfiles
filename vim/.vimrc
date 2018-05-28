set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'spf13/vim-autoclose'
Plugin 'wikitopian/hardmode'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
" Plugin 'Lokaltog/vim-powerline'
call vundle#end()            " required
filetype plugin indent on    " required


" Colors
syntax on
syntax enable
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta
colorscheme github

let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'no arrows!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Tabs and spaces
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

map <C-n> :NERDTreeToggle<CR>


let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline_theme='angr'
