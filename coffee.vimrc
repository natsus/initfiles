
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" 保存時にコンパイル
" autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
" Crtl + c でコンパイルし，顔面分割
" nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

