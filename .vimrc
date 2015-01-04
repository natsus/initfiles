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

" vim と mac のクリップボードを連携
set clipboard+=unnamed

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
set tabstop=2
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=2
" インデントの各段階に使われる空白の数
set shiftwidth=2
" タブを挿入するとき、代わりに空白を使わない
set noexpandtab

".rhtml, .rbでタブ幅を2に変更
" au BufNewFile,BufRead *.rhtml set nowrap tabstop=2 shiftwidth=2
" au BufNewFile,BufRead *.rb    set nowrap tabstop=2 shiftwidth=2

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2

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

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

"" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

"" Unite source
NeoBundle 'Shougo/unite-outline'


"" その他
NeoBundle 'tpope/vim-endwise.git' 
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'Townk/vim-autoclose'

"" 補完
"NeoBundle 'Shougo/neocomplcache'
" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle "Shougo/neosnippet"
NeoBundle "Shougo/neosnippet-snippets"
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

"" markdown のsyntaxハイライト
NeoBundle 'tpope/vim-markdown'

"" surround.vim
NeoBundle 'tpope/vim-surround'


"---------------------------------------------
" coffeescript の設定 (syntax + 自動compile)
"---------------------------------------------

NeoBundle 'kchmck/vim-coffee-script'

if filereadable(expand('~/initfiles/coffee.vimrc'))
    source ~/initfiles/coffee.vimrc
endif


"---------------------------------------------
" lightline の設定
"   indentの深さに色を付ける
"---------------------------------------------
NeoBundle 'nathanaelkane/vim-indent-guides'


" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1

"---------------------------------------------
" lightline の設定
"---------------------------------------------

"" status bar highlight
set guifont=Ricty\ for\ Powerline

NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"" git (lightline.vimで使用)
NeoBundle 'tpope/vim-fugitive.git'


filetype plugin indent on     " required!
filetype indent on
syntax on

"---------------------------------------------
" neosnippet の設定
"---------------------------------------------

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" tex のコードが見にくくなるのでコメントアウト
" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif


" unite の設定
if filereadable(expand('~/initfiles/unite.vimrc'))
    source ~/initfiles/unite.vimrc
endif

" vim-latex の設定
if filereadable(expand('~/initfiles/vimlatex.vimrc'))
    source ~/initfiles/vimlatex.vimrc
endif

" neocomplete.vim
if filereadable(expand('~/initfiles/neocomplete.vimrc'))
    source ~/initfiles/neocomplete.vimrc
endif

"----------------------------------------------------
" セミコロンとコロンを入れ替えるスクリプト (US, JIS) 
"----------------------------------------------------
" http://www.ibm.com/developerworks/jp/linux/library/l-vim-script-1/
" http://vim-users.jp/2010/06/hack158/

:function! SwapColSemicol()
:    let g:col_semicol = exists('g:col_semicol') ? !g:col_semicol : 1
:    if g:col_semicol
:        nnoremap : ;
:        nnoremap ; :
:    else
:        nnoremap : :
:        nnoremap ; ;
:    endif
:endfunction

command! SwapColonSemiColon call SwapColSemicol()
