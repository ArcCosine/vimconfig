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
Bundle 'Shougo/vimproc'
Bundle 'tpope/vim-surround.git'
Bundle 'thinca/vim-quickrun.git'
Bundle 'mattn/zencoding-vim.git'
Bundle 'tpope/vim-fugitive'

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>


"Zen Coding用
let g:user_zen_settings = {
\'lang': "ja"
\}

"neocomplcache用
let g:neocomplcache_enable_at_startup = 1 

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
