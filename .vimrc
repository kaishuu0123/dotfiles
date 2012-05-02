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
"set encoding=euc-jp
"set fileencoding=euc-jp
"set fileencodings=utf-8,euc-jp,iso2022-jp,shift-jis,utf-16,ucs-2-internal,ucs-2"set fileformats=unix,dos,mac
set number
set ruler

syntax on
colorscheme delek
set showmatch
"set smarttab
"set expandtab
"set shiftwidth=4
set tabstop=8
"set softtabstop=4
"set smartindent
"set ignorecase
"set smartcase
set shortmess+=I
set list
"set listchars=tab:>.,eol:$,trail:_,extends:\
set listchars=tab:>.
set hlsearch

let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Kouki Ooyatsu"

set nocompatible
filetype off 

" init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Markdown'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-markdown'

filetype plugin indent on
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
			\ 'command': 'bluecloth',
			\ 'exec': '%c -f %s'
			\ }
