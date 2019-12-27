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
Plug 'cespare/vim-toml'

" color theme
Plug 'morhetz/gruvbox'

if hostname == "mini"
  Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Languages
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  Plug 'tomlion/vim-solidity'
  Plug 'LnL7/vim-nix'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
endif
call plug#end()

let mapleader = ","

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
" exit on file open
let NERDTreeQuitOnOpen=1

" Ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_theme = 'gruvbox'

" airline
let g:airline_theme='gruvbox'

" tmux-complete
let g:tmuxcomplete#trigger = ''

" remaps . menu from C-n and C-i to Tab
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"
let g:deoplete#enable_at_startup=1

if hostname == "mini"

  " vim-go higlights
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  " let g:go_auto_sameids = 1  " highlights same variable names
  let g:go_auto_type_info = 1
  let g:go_addtags_transform = "snakecase"
  let g:go_code_completion_enabled = 1
  let g:go_info_mode = 'gopls'
  let g:go_doc_popup_window = 0
  let g:go_gopls_complete_unimported = 1
  let g:go_echo_command_info = 1
  let g:go#statusline#Show = 1
  setlocal omnifunc=go#complete#Complete
  
  " This triggers the . menu
  au FileType go inoremap <buffer> . .<C-x><C-o>
 
  " markdown-composer
  let g:markdown_composer_browser = 'firefox-devedition'

  " Racer
  set hidden
  let g:racer_cmd = "/home/sebas/.nix-profile/bin/racer"
  let g:racer_experimental_completer = 1
  au FileType rust nmap <leader>rx <Plug>(rust-doc)
  au FileType rust nmap <leader>rd <Plug>(rust-def)
  au FileType rust nmap <leader>rs <Plug>(rust-def-split)

endif


