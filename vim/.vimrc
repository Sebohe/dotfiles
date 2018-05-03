set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"wmit  Plugin 'davidhalter/jedi-vim'

" Plugin 'sentientmachine/Pretty-Vim-Python'

" Plugin 'scrooloose/syntastic'

Plugin 'wikitopian/hardmode'

Plugin 'tomlion/vim-solidity'

Plugin 'flazz/vim-colorschemes'

Plugin 'ervandew/supertab'

" Plugin 'Lokaltog/vim-powerline'

" Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
syntax enable

" Colors
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta
" favorite themes: {{{
" Ligh {{{
"  sol-term
"  lightning
"  PapayaWhip
"  github
"  newspaper
"  Saturn
"  laederon
"  stonewashed-256
" }}}
" Dark {{{
" forgotten-dark
" }}}
"
" }}}
colorscheme scite

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
" set hlsearch

" jedi python
" let g:jedi#popup_on_dot = 0

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=500 ttimeoutlen=0

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

autocmd FileType markdown setlocal spell
