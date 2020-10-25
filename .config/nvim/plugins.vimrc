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
Plug 'dense-analysis/ale'
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

" Ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_theme = 'gruvbox'
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1

" airline
let g:airline_theme='gruvbox'

" tmux-complete
let g:tmuxcomplete#trigger = ''

if hostname == "mini"
  " markdown-composer
  let g:markdown_composer_browser = 'chromium'
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_save = 1
  let g:airline#extensions#ale#enabled = 1

  " COC
  source ~/.config/nvim/coc.vimrc
endif
