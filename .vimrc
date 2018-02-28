call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
"Plugin 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'osyo-manga/vim-over'
Plug 'mhinz/vim-startify'
Plug 'dyng/ctrlsf.vim'
Plug 'evidens/vim-twig'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-rails'
Plug 'marlun/vim-starwars'
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Colorscheme "
syntax on
set background=dark
colorscheme solarized

" Tab settings, line numbering "
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set nu

" Clear empty lines on save "
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
let g:airline_theme = 'solarized'

" JSON format "
com! FormatJSON %!python -m json.tool

if !exists("g:vdebug_options")
    let g:vdebug_options = {}
endif
let g:vdebug_options["port"] = 9001
let g:vdebug_options["idekey"] = "xdebug"

