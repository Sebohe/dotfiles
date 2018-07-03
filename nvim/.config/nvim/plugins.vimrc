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

" Colors
syntax on
syntax enable
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta
colorscheme seattle

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" ale
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline_theme='deus'
