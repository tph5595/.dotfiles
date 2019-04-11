" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" My plugins
" File tree
Plugin 'scrooloose/nerdtree'
" Syntax linting stuff 
Plugin 'scrooloose/syntastic'
" Surround stuff with stuff 
Plugin 'tpope/vim-surround'
" Pretty colors
Plugin 'altercation/vim-colors-solarized'
" Bottom bar beauty
Plugin 'bling/vim-airline'
" Fuzzy Search
Plugin 'kien/ctrlp.vim'
" Autocomplete
Plugin 'valloric/YouCompleteMe'
" Align stuff
Plugin 'godlygeek/tabular'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set showmatch " highlight matching braces
set showmode " show insert/replace/visual mode

set autoindent
set nu rnu

" edit settings
set backspace=indent,eol,start " backspacing over everything in insert mode
set expandtab " fill tabs with spaces
set nojoinspaces " no extra space after '.' when joining lines
set shiftwidth=6 " set indentation depth to 6 columns
set softtabstop=6 " backspacing over 6 spaces like over tabs
set tabstop=6 " set tabulator length to 6 columns
set textwidth=80 " wrap lines automatically at 80th column

" syntax highlighting
syntax enable " enable syntax highlighting

" write settings
set confirm " confirm :q in case of unsaved changes

" Show file stats
set ruler

" Color theming
" solarized options 
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
let g:solarized_termcolors=128
colorscheme solarized
set background=dark
