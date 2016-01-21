set nocompatible
filetype off 

if isdirectory($HOME."/.vim/vundle.git")
  " init Vundle
  set rtp+=~/.vim/vundle.git/
  call vundle#rc()
  
  Bundle 'gmarik/vundle'
  
  Bundle 'thinca/vim-quickrun'
  Bundle 'Zenburn'
  Bundle 'scrooloose/nerdtree'
  Bundle 'xmledit'
  Bundle 'Align'
  Bundle 'sudo.vim'
  Bundle 'surround.vim'
  Bundle 'Shougo/neocomplcache'
  Bundle 'mattn/emmet-vim'
  Bundle 'AutoClose'
  " syntax checking plugins exist for eruby, haml, html, javascript, php, python, ruby and sass.
  Bundle 'scrooloose/syntastic'
  Bundle 'fholgado/minibufexpl.vim'
  Bundle 'jistr/vim-nerdtree-tabs'
  Bundle 'superbrothers/vim-bclose'
  Bundle 'mattn/webapi-vim'
  Bundle 'hail2u/vim-css3-syntax'
  Bundle 'taichouchou2/html5.vim'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'jtratner/vim-flavored-markdown'
  " ステータスバーをちょっとリッチに
  Bundle 'itchyny/lightline.vim'
  Bundle 'Markdown'

  "NERD_tree.vim
  ""---------------------
  nnoremap <f2> :NERDTreeToggle<CR>
  ""最後に残ったウィンドウがNERDTREEのみのときはvimを閉じる
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  let g:NERDTreeDirArrows=0
  let g:NERDTreeMouseMode=0
  
  let file_name = expand("%")
  if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * NERDTree ./
  endif

  augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END
endif

syntax on
filetype on
filetype plugin on
filetype indent on
colorscheme desert

"set termencoding=euc-jp
set fileformats=unix
set ts=2
"set encoding=euc-jp
"set fileencoding=euc-jp
set fileencodings=utf-8,euc-jp,iso2022-jp,shift-jis,utf-16,ucs-2-internal,ucs-2"set fileformats=unix,dos,mac
set number
set ruler

set showmatch
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2
"set softtabstop=4
"set smartindent
"set ignorecase
"set smartcase
set shortmess+=I
set list
set listchars=tab:>.,eol:$,trail:_,extends:\
set listchars=tab:>.
set hlsearch

let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Kouki Ooyatsu"

set laststatus=2
let ff_table = {'dos' : 'CR+LF', 'unix' : 'LF', 'mac' : 'CR' }

" ウィンドウを閉じずにバッファを閉じる
function! s:BufcloseCloseIt(bang)
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    " bangが空でバッファが変更されている場合bwipeoutは失敗するのでnewは不要
    if a:bang == '!' || &mod==0
      new
    endif
  endif

  if buflisted(l:currentBufNum)
    execute "silent bwipeout".a:bang." ".l:currentBufNum
    " bwipeoutに失敗した場合はウインドウ上のバッファを復元
    if bufloaded(l:currentBufNum) != 0
      execute "buffer " . l:currentBufNum
    endif
  endif
endfunction

" バッファ移動を楽にする
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

" The prefix key.
nnoremap    [Buf]   <Nop>
nmap    b [Buf]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Buf]'.n  ':<C-u>bn'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Buf]a :ba<CR>
" tc 新しいタブを一番右に作る
map <silent> [Buf]x :Bclose<CR>
" tx タブを閉じる
map <silent> [Buf]n :bn<CR>
" tn 次のタブ
map <silent> [Buf]p :bp<CR>
" tp 前のタブ
