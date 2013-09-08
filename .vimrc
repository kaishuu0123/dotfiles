set nocompatible
filetype off 

" init Vundle
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Markdown'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-markdown'
Bundle 'Zenburn'
Bundle 'project.tar.gz'
Bundle 'scrooloose/nerdtree'
Bundle 'Align'
Bundle 'nerdtree'
Bundle 'sudo.vim'
Bundle 'gtags.vim'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'closetag.vim'
Bundle 'surround.vim'
""Bundle 'Shougo/neocomplcache'
Bundle 'ZenCoding.vim'
Bundle 'AutoClose'
Bundle 'othree/html5.vim'
Bundle 'xmledit'
" syntax checking plugins exist for eruby, haml, html, javascript, php, python, ruby and sass.
Bundle 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'superbrothers/vim-bclose'

filetype plugin indent on
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
			\ 'command': 'bluecloth',
			\ 'exec': '%c -f %s'
			\ }

filetype on
filetype plugin on
set nocompatible
set notitle

noremap  
noremap!  
noremap <BS> 
noremap! <BS> 

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

au QuickfixCmdPost make,grep,grepadd,vimgrep copen
syntax on
colorscheme desert

map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

set laststatus=2
let ff_table = {'dos' : 'CR+LF', 'unix' : 'LF', 'mac' : 'CR' }
let &statusline='%<%f %h%m%r%w[%{(&fenc!=""?&fenc:&enc)}:%{ff_table[&ff]}] %-14.(%l,%c%V%) %P'

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName()


inoremap <C-]> <C-R>=GetCloseTag()<CR><ESC>F<i
map <C-]> a<C-]><ESC>

"let g:neocomplcache_enable_at_startup = 1
"au! BufRead,BufNewFile *.tt     setfiletype tt.html
"let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"



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

let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * NERDTree ./
endif
