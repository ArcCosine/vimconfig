""""""""""""""""""""""""""""""
"内部エンコーディングの設定
""""""""""""""""""""""""""""""
if has('gui_running') && !has('unix')
  set encoding=utf-8
endif
scriptencoding cp932 

filetype off
filetype indent on
syntax enable


"行番号表示
set number

"バックアップは邪魔臭いので要らない
set nobackup

"クリップボードへコピー
set clipboard=unnamed

"for vundler

set rtp+=~/.vim/vundle/
call vundle#rc()
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/vimshell.git'
Bundle 'Shougo/unite.vim.git'
Bundle 'Shougo/git-vim.git'
Bundle 'Shougo/vimproc'
Bundle 'tpope/vim-surround.git'
Bundle 'thinca/vim-quickrun.git'
Bundle 'mattn/zencoding-vim.git'
Bundle 'smartchr'

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>


"Zen Coding用
let g:user_zen_settings = {
\'lang': "ja"
\}

"neocomplcache用
let g:neocomplcache_enable_at_startup = 1 

"for unite
"バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
"常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
"全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"ウインドウを横に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"ウインドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
"ESCキーを２回押すと終了する
au FileType unite nnoremap <silent> <ESC><ESC> q
au FileType unite inoremap <silent> <ESC><ESC> q



"バッファ系
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2


"ゴミ削除
function! RTrim()
let s:cursor = getpos(".")
%s/\s\+$//e
call setpos(".", s:cursor)
endfunction

autocmd BufWritePre *.php,*.rb,*.js,*.bat,*.py call RTrim()
