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
" insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'
" tmux integration for vim
Plugin 'benmills/vimux'
" enables repeating other supported plugins with the . command
Plugin 'tpope/vim-repeat'
" comment da tings
Plugin 'tpope/vim-commentary'

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

 set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
"
"Color theming
" solarized options 
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Taken from https://github.com/nicknisi/dotfiles/blob/master/config/nvim/init.vim
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

set autoread " detect when a file is changed

set history=1000 " change history to 1000

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

" if has('mouse')
  " set mouse=a
" endif

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set wildmode=list:longest " complete files like a shell
set shell=$SHELL

" code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1


" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" shortcut to save
nmap <leader>, :w<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }

" :W sudo saves the file 
" Used to handle the permission denied errors
command W w !sudo tee % > /dev/null

map <Leader>mt :call VimuxRunCommand("clear; make test")<CR>
map <Leader>mm :call VimuxRunCommand("clear; make")<CR>

" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
