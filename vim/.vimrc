" use Vim mode instead of pure Vi, it must be the first instruction
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" File tree
Plug 'scrooloose/nerdtree'
" Surround stuff with stuff 
Plug 'tpope/vim-surround'
" Pretty colors
Plug 'altercation/vim-colors-solarized'
" Bottom bar beauty
Plug 'bling/vim-airline'
" Fuzzy Search
Plug 'kien/ctrlp.vim'
" Autocomplete
Plug 'valloric/YouCompleteMe'
" Align stuff
Plug 'godlygeek/tabular'
" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'
" tmux integration for vim
" Plug 'benmills/vimux'
" enables repeating other supported plugins with the . command
Plug 'tpope/vim-repeat'
" comment da tings
Plug 'tpope/vim-commentary'
" Good markdown stuff <leader>e for code block editing with syntax highitng in
" sepereate window
Plug 'gabrielelana/vim-markdown'
" NeovimStuff
Plug 'neomake/neomake'
" Icons for vim
Plug 'ryanoasis/vim-devicons'

call plug#end()

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

map <Leader>h :noh<CR>
map <Leader>l <esc>G$

" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>"'"]"]'"

inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

vnoremap <Leader>u :'<,'>s/\<./\u&/g

map <Leader>l :w<CR> :call VimuxRunCommand("pdflatex *.tex; pdflatex *.tex")<CR>

noremap <Leader>s :setlocal spell! spelllang=en_us<CR> 

" NeoVim Additions
" https://thoughtbot.com/blog/my-life-with-neovim
" Run NeoMake on read and write operations
" autocmd! BufReadPost,BufWritePost * Neomake NEEDED???

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

" When shortcut files are updated, renew bash and ranger configs with new material:
       autocmd BufWritePost files,directories,aliases !shortcuts
