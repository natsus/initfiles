"---------------------------------------------
" VIM-LaTeX
"---------------------------------------------
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
"let g:Imap_UsePlaceHolders = 1
"let g:Imap_DeleteEmptyPlaceHolders = 1
"let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
"let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = '/usr/texbin/ptex2pdf -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/ptex2pdf -l -u -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
""let g:Tex_CompileRule_pdf = '/usr/texbin/luajitlatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_pdf = '/usr/texbin/dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = '/usr/local/bin/ps2pdf $*.ps'
"let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
"let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'

"let g:Tex_CompileRule_dvi = '/usr/texbin/platex -synctex=1 -interaction=nonstopmode -file-line-error-style -kanji=sjis $*'
let g:Tex_CompileRule_dvi = '/usr/texbin/platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'

"let g:Tex_CompileRule_dvi = '/usr/texbin/uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/bibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/bibtexu'
"let g:Tex_MakeIndexFlavor = '$*.idx'
"let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex $*.idx'
"let g:Tex_MakeIndexFlavor = '/usr/texbin/makeindex $*.idx'
"let g:Tex_MakeIndexFlavor = '/usr/texbin/texindy $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Skim.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXShop.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a TeXworks.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a Firefox.app'
"let g:Tex_ViewRule_pdf = '/usr/bin/open -a "Adobe Reader.app"'
"let g:Tex_ViewRule_ps = '/usr/bin/open'
"let g:Tex_ViewRule_dvi = '/usr/bin/open'

" フォント関係のwarningを無視 dvi→pdfの処理が止まってしまうので
let g:Tex_IgnoredWarnings =
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \"Font shape \`JT1/gt/m/it\' undefined"."\n".
    \"Font shape \`JY1/gt/m/it\' undefined"."\n".
    \"Font shape \`JT1/mc/m/it\' undefined"."\n".
    \"Font shape \`JY1/mc/m/it\' undefined"."\n".
    \"Font shape \`JT1/mc/bx/it\' undefined"."\n".
    \"Font shape \`JY1/mc/bx/it\' undefined"."\n".
    \'LaTeX Font Warning: Some font shapes were not available, defaults substituted.'
let g:Tex_IgnoreLevel = 14

" Makefile を読み込ませない
let g:Tex_UseMakefile = 0
" 自動的に折りたたみ off
let g:Tex_AutoFolding = 0

" Mac ではalt+key が入力できないのでマッピング変更
imap ∫ <Plug>Tex_MathBF
imap ç <Plug>Tex_MathCal
imap ¬ <Plug>Tex_LeftRight
imap \it <Plug>Tex_InsertItemOnThisLine
" EALの入力で
" \begin{align}
" <++>
" \label{eq:<++>}
" \end{align}<++>
" を出力する。
augroup MyIMAPs
    au!
    au VimEnter * call IMAP('EAL','\begin{align}<++>\label{eq:<++>}\end{align}<++>','tex')
augroup END
