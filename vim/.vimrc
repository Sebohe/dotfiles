call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'wikitopian/hardmode'
Plug 'flazz/vim-colorschemes'
Plug 'tomlion/vim-solidity'
Plug 'jelera/vim-javascript-syntax'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()
" Remap W to w
command WQ wq
command Wq wq
command W w
command Q q

" Line numbers
set number

" Colors
syntax on
syntax enable
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta
" colorscheme vimbrant
colorscheme seattle

" let g:HardMode_level = 'wannabe'
" let g:HardMode_hardmodeMsg = 'no arrows!'
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

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

" ale
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline_theme='deus'
