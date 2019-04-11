" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

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

" Put your non-Plugin stuff after this line

set showmatch " highlight matching braces
set showmode  " show insert/replace/visual mode

set autoindent
set nu rnu

" edit settings
set backspace=indent,eol,start " backspacing over everything in insert mode
set expandtab                  " fill tabs with spaces
set nojoinspaces               " no extra space after '.' when joining lines
set shiftwidth=6               " set indentation depth to 6 columns
set softtabstop=6              " backspacing over 6 spaces like over tabs
set tabstop=6                  " set tabulator length to 6 columns
set textwidth=80               " wrap lines automatically at 80th column

" syntax highlighting
syntax enable " enable syntax highlighting

" write settings
set confirm " confirm :q in case of unsaved changes

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree if vim was opened with no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Show hiddent files in NERDTree
let NERDTreeShowHidden=1

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
