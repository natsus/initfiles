""" unite.vim

" The prefix key.
nnoremap [unite] <Nop>
nmap , [unite]

" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_enable_split_vertically = 1 "縦分割で開く
" let g:unite_winwidth = 40 "横幅40で開く
let g:unite_source_file_mru_limit = 200

nnoremap <silent> [unite]f  :<C-u>UniteWithCurrentDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files buffer file file_mru<CR>
" nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]t  :<C-u>Unite tab -buffer-name=tabs<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>
" nnoremap  [unite]f  :<C-u>Unite source<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -start-insert file_rec/async:!<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <silent> [unite]h  :<C-u>Unite history/yank<CR>

nnoremap <silent> [unite]s
	\ :<C-u>Unite -buffer-name=files -no-split
	\ jump_point file_point buffer_tab
	\ file_rec:! file file/new<CR>

" Like ctrlp.vim settings.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1,
"\   'winheight': 10,
"\   'direction': 'botright',
"\ })

" Prompt choices.
"call unite#custom#profile('default', 'context', {
"\   'prompt': '» ',
"\ })

if executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " ウィンドウを分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " ESCキーを押すと終了
  nmap <silent> <buffer> <ESC><ESC> <Plug>(unite_exit)
  imap <silent> <buffer> <ESC><ESC> <Plug>(unite_exit)
endfunction
