set nocompatible
filetype off 

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
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/webapi-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'taichouchou2/html5.vim'
Bundle 'taichouchou2/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'jtratner/vim-flavored-markdown'
" ソースコード上のメソッド宣言、変数宣言の一覧を表示
Bundle "taglist.vim"
" ステータスバーをちょっとリッチに
Bundle 'itchyny/lightline.vim'
Bundle 'Markdown'
Bundle 'sousu/VimRepress'
Bundle 'suan/vim-instant-markdown'

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
""let &statusline='%<%f %h%m%r%w[%{(&fenc!=""?&fenc:&enc)}:%{ff_table[&ff]}] %-14.(%l,%c%V%) %P'

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName()

" for taglist.vim
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
map <C-T> :Tlist <CR>
nnoremap tt  <C-]>
nnoremap tn  :<C-u>tag<CR>
nnoremap tp  :<C-u>pop<CR>

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

"" Source Explorer
"自動でプレビューを表示する。TODO:うざくなってきたら手動にする。またはソースを追う時だけ自動に変更する。
let g:SrcExpl_RefreshTime   = 1
"プレビューウインドウの高さ
let g:SrcExpl_WinHeight     = 9
"tagsは自動で作成する
let g:SrcExpl_UpdateTags    = 1
"マッピング
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey  = "<C-b>"
nmap <F8> :SrcExplToggle<CR>

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

" alpaca_tags
" ~/.ctagsにctagsの設定ファイルを設置します。現在無い人は、このディレクトリ内の.ctagsをコピーしてください。
" 適切なlanguageは`ctags --list-maps=all`で見つけてください。人によりますので。
let g:alpaca_tags_config = {
      \ '_' : '-R --sort=yes --languages=-js,html,css',
      \ 'ruby': '--languages=+Ruby',
      \ }

augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost * TagsUpdate ruby
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
  endif
augroup END

nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'


"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 1

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

