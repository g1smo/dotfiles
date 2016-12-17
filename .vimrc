" Terminal color override "
set t_Co=256
let g:rehash256 = 1

colorscheme molokai

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'othree/html5.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'osyo-manga/vim-over'
Plugin 'mhinz/vim-startify'
Plugin 'godlygeek/csapprox'
Plugin 'dyng/ctrlsf.vim'
Plugin 'evidens/vim-twig'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-rails'
Plugin 'marlun/vim-starwars'

call vundle#end()

" Syntax on, tab settings, line numbering
filetype plugin indent on
syn on
set expandtab
set tabstop=2
set shiftwidth=2
set nu

" Clear empty lines on save
autocmd BufWritePre * silent! :%s/\s+$//e

" CtrlP opening of files "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

" Tabularize shortcut "
map <C-T> :Tabularize 

" File tree shortcut "
map <C-A> :NERDTree <CR>

" Find all "
map <C-F> :CtrlSF 
let g:ctrlsf_position = "right"

" Directory listing thing "
let g:netrw_liststyle = 3

" Gvim stuff "
if has("gui_running")
	set guifont=Inconsolata-g\ Medium\ 9
endif
set guioptions-=m " Remove menubar
set guioptions-=T " Remove toolbar

" Mapleader shortcut key "
let mapleader = ","
let maplocalleader = "\\"

" Autocomplete "
let g:neocomplcache_enable_at_startup = 1

" Brunch error fix "
set nowritebackup

" Airline stuff "
let g:airline_powerline_fonts = 1
let g:airline_theme = "wombat"

" JSON format "
com! FormatJSON %!python -m json.tool

if !exists("g:vdebug_options")
    let g:vdebug_options = {}
endif
let g:vdebug_options["port"] = 9001
let g:vdebug_options["idekey"] = "xdebug"
