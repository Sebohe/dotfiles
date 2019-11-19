" deoplete
let g:deoplete#enable_at_startup=1
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-i>"

" 
let g:deoplete#sources#go#gocode_binary = '/home/sebas/.go/bin/gocode'

" let g:deoplete#sources#go#package_dot 	0 	No
" let g:deoplete#sources#go#sort_class 	[] 	Recommend
" g:deoplete#sources#go#cgo 	0 	Any
" g:deoplete#sources#go#goos 	'' 	No
" g:deoplete#sources#go#source_importer 	0 	No
" g:deoplete#sources#go#builtin_objects 	0 	No
" g:deoplete#sources#go#unimported_packages 	0 	No
" g:deoplete#sources#go#fallback_to_source 	0 	No
au filetype go inoremap <buffer> . .<C-x><C-o>
