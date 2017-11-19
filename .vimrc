set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'davidhalter/jedi-vim'

" Plugin 'sentientmachine/Pretty-Vim-Python'

" Plugin 'scrooloose/syntastic'

Plugin 'tomlion/vim-solidity'

Plugin 'flazz/vim-colorschemes'

Plugin 'ervandew/supertab'

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme forgotten-dark

syntax on
syntax enable

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ff=unix

let g:jedi#popup_on_dot = 0

