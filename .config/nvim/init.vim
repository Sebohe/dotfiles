au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set ls=0
set encoding=utf-8
set t_Co=256
set termencoding=utf-8

" Remap some common misstypes due
" to fast fingers
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

autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
filetype plugin indent on
set backspace=indent,eol,start

set number
set relativenumber
set noeol
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

" Change vim splits from C + W <direction> to just C <direction>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
" set timeoutlen=500 ttimeoutlen=0
set timeout timeoutlen=500 ttimeoutlen=100

" Maintain undo history between sessions
set undofile 
set undodir=~/.vim/undodir

" Add spell check to markdown files
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown set conceallevel=2
hi SpellBad cterm=underline

" Write as sudo
cmap w!! w !sudo tee > /dev/null %

"enable mouse support
set mouse=a
syntax on
set guifont=Fira\ Code:h11

" Source plugins
if has('nvim')
  source ~/.config/nvim/plugins.vimrc
  source ~/.config/nvim/omnifuncs.vimrc
endif
