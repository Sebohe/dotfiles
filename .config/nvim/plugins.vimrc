let hostname = substitute(system('hostname'), '\n', '', '')

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
     !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'wellle/tmux-complete.vim'
Plug 'LnL7/vim-nix'
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'


if hostname == "mini"
  Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
endif
call plug#end()

let mapleader = ","

" Theme
set termguicolors
colorscheme gruvbox8
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta
let g:gruvbox_transp_bg = 1
let g:gruvbox_italicize_strings = 0

" Nerd tree
map <C-n> :NERDTreeToggle<CR>
" exit on file open
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['node_modules']

" airline
let g:airline_theme='gruvbox'

" tmux-complete
let g:tmuxcomplete#trigger = ''

if hostname == "mini"
  " markdown-composer
  let g:markdown_composer_browser = 'chromium'
  " COC
  source ~/.config/nvim/coc.vimrc
endif
