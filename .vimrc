" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible

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
"set background=dark " dark background for console

" write settings
set confirm " confirm :q in case of unsaved changes

" Show file stats
set ruler
