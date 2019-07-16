" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType go setlocal omnifunc=gocomplete#Complete
augroup end

" Set bin if you have many instalations
let g:deoplete#sources#ternjs#tern_bin = '/home/sebas/.local/bin/tern'
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#docs = 0
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 0
let g:deoplete#sources#ternjs#guess = 0
let g:deoplete#sources#ternjs#sort = 1
let g:deoplete#sources#ternjs#expand_word_forward = 0
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#in_literal = 0
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" tern
let g:deoplete#sources#ternjs#filetypes = [
	\ 'jsx',
	\ 'javascript.jsx',
	\ 'javascript',
  \ 'tsx',
  \ 'typescript',
  \ 'typescript.tsx',
	\ ]

" Go
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:deoplete#sources#go#filetypes = [
	\ 'go',
	\ ]
let g:deoplete#sources#go#gocode_binary = '/home/sebas/.go/bin/gocode'
let g:deoplete#sources#go#package_dot = 0
let g:deoplete#sources#go#sort_class = ['var', 'func', 'type', 'package', 'const']
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#builtin_objects = 1
let g:deoplete#sources#go#fallback_to_source	= 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" enable deoplete at startup and make sure the autocompletion will actually
" trigger using the omnifuncs set later on.
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:deoplete#auto_complete_delay = 0
let g:deoplete#enable_at_startup = 1
