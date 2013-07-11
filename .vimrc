"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行

set backspace=indent,eol,start

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとる
set backup
" バックアップをとらない
"set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップファイルを作るディレクトリ
set backupdir=~/.vim/backup
" スワップファイルを作るディレクトリ
set directory=~/.vim/swap

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチを使わない
"set noincsearch
" インクリメンタルサーチ
set incsearch

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示しない
set nonumber
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

" カラー設定
colorscheme darkblue

"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを無効にする
"set noautoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使わない
set noexpandtab

".rhtml, .rbでタブ幅を2に変更
au BufNewFile,BufRead *.rhtml set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb    set nowrap tabstop=2 shiftwidth=2

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I




"----------------------------------------------------
" 独自設定
"----------------------------------------------------
" スクロール時の余白確保
set scrolloff=5
" 他で書き換えられたら自動で読み直す
set autoread
" 行番号表示
set number

" インデント
set autoindent
set smartindent
set cindent
set expandtab " タブをスペースで展開する

" コマンド補完を開始するキー
set wildchar=<tab>

set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする

" キーバインド関係
" 行単位で移動(1行が長い場合に便利)
nnoremap j gj
nnoremap k gk

" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

"追加
	noremap <CR> o<ESC>


"----------------------------------------------------
" NeoBundle
"----------------------------------------------------
                                                                                           
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github

NeoBundle 'Shougo/neobundle.vim', {
  \ 'depends': ['Shougo/unite.vim'],
 \ }
" NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

"" その他
NeoBundle 'tpope/vim-endwise.git' 
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

"" 補完
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'taichouchou2/vim-rsense'

"" コメント
"NeoBundle 'tomtom/tcomment_vim'
"NeoBundle 'taichouchou2/surround.vim'

"" railsサポート
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'

"" reference環境
"NeoBundle 'thinca/vim-ref'
"NeoBundle 'taichouchou2/vim-ref-ri'
"NeoBundle 'taq/vim-rspec'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on


""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
let g:unite_enable_split_vertically = 1 "縦分割で開く
" let g:unite_winwidth = 40 "横幅40で開く

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了    
"
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"---------------------------------------------
" VIM-LaTeX
"---------------------------------------------
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
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
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
"let g:Tex_CompileRule_dvi = '/usr/texbin/platex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_dvi = '/usr/texbin/uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/bibtex'
"let g:Tex_BibtexFlavor = '/usr/texbin/bibtexu'
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
let g:Tex_ViewRule_ps = '/usr/bin/open'
let g:Tex_ViewRule_dvi = '/usr/bin/open'
