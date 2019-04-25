call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'tomlion/vim-solidity'
Plug 'jelera/vim-javascript-syntax'
Plug 'rust-lang/rust.vim'
Plug 'carlitux/deoplete-ternjs', {
      \'do': 'npm install -g tern',
      \'for': ['javascript', 'javascript.jsx']
\     }
Plug 'othree/jspc.vim', { 'for': [
\     'javascript', 
\     'javascript.jsx', 
\     'typescript',
\     'typescript.tsx',
\   ]}
Plug 'wellle/tmux-complete.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'othree/html5.vim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Colors
syntax on
syntax enable
hi MatchParen cterm=underline ctermbg=none ctermfg=magenta
colorscheme seattle

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\}
  
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'scss': ['prettier'],
\    'html': ['prettier'],
\}

let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:airline_theme='deus'

" tmux-complete
let g:tmuxcomplete#trigger = ''

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd FileType javascript setlocal formatprg=prettier\ --parser\ javascript

