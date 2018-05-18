set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'

Plugin 'scrooloose/nerdtree'

Plugin 'wikitopian/hardmode'

Plugin 'flazz/vim-colorschemes'

Plugin 'ervandew/supertab'

Plugin 'Lokaltog/vim-powerline'

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
colorscheme vimbrant

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

" Synstastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"


map <C-n> :NERDTreeToggle<CR>
"
