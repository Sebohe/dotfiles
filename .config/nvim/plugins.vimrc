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
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'wellle/tmux-complete.vim'
Plug 'morhetz/gruvbox'

Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}

" Languages
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

Plug 'tomlion/vim-solidity'


call plug#end()

" Theme
colorscheme gruvbox
let g:gruvbox_improved_strings = 0
let g:gruvbox_invert_selection = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_contrast_dark = "hard"
set background=dark
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_theme = 'gruvbox'

" airline
let g:airline_theme='gruvbox'

" tmux-complete
let g:tmuxcomplete#trigger = ''

" markdown-composer
let g:markdown_composer_browser = 'firefox-developer-edition'

" Go
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
