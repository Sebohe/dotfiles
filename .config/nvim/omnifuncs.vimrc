" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType go setlocal omnifunc=gocomplete#Complete
  autocmd FileType rust setlocal omnifunc=rustcomplete#Complete
augroup end
