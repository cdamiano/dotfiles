set nocompatible           " get rid of Vi compatibility mode. SET FIRST!
set laststatus=2           " last window always has a statusline
set nohlsearch             " Don't continue to highlight searched phrases.
set incsearch              " But do highlight as you type your search.
set ignorecase             " Make searches case-insensitive.
set ruler                  " Always show info along bottom.
set autoindent             " auto-indent
set tabstop=2              " tab spacing
set softtabstop=2          " unify
set shiftwidth=2           " indent/outdent by 4 columns
set shiftround             " always indent/outdent to the nearest tabstop
set expandtab              " use spaces instead of tabs
set smarttab               " use tabs at the start of a line, spaces elsewhere
set nowrap                 " don't wrap text
set nu
set ttimeoutlen=10         "wait for 10ms after escape
set hidden                 "Hide the buffers
set tags=./tags            "Where to find ctags

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let mapleader = ";" "set the leader key to ';' (easy to type)
nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-l> redraws the screen and removes any search highlighting.

"Enable Matchit
runtime macros/matchit.vim

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/tComment'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-rails'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'othree/html5.vim'
Bundle 'wavded/vim-stylus'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/emmet-vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'wookiehangover/jshint.vim'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'ags/tslime.vim'
Bundle 'benmills/vimux'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-abolish'
Bundle 'nginx.vim'
Bundle 'vim-scripts/ZoomWin'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Look and Feel
set background=dark
colorscheme molokai
" colorscheme solarized
" colorscheme vividchalk

set cursorline " Highlight the current line
" set cuc cul " Highlight active column
set number
set ruler
set eol " force blank lines at end of file
syntax on
filetype off
filetype plugin indent on
set scrolloff=3
set encoding=utf-8
set fileencodings=utf-8
set t_Co=256               " enable 256-color mode.
syntax enable              " enable syntax highlighting (previously syntax on).
set term=screen-256color

if has('gui_running')
  set guifont=Inconsolata:h14:
endif


" Open Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.swp$','.DS_Store', '.git[[dir]]', '.sass-cache[[dir]]']

" Fix multiple cursors key mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-d>'
let g:multi_cursor_skip_key='<C-g>'
let g:multi_cursor_quit_key='<Esc>'

" Tabs
map <C-t> :tabnew<CR>
map <Leader>h gt
map <Leader>l gT
map <Leader>T <C-W>T<CR> " Move split into a new Tab
map <Leader>X :tabclose<CR> " Close current Tab

" Tag bar
let g:tagbar_left=1
map <Leader>tg :TagbarOpenAutoClose<CR>

let NERDTreeShowHidden=1

" Coffeescript Support
hi link coffeeReservedError NONE
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

" No swp files
set noswapfile

" Set up syntaxes
au BufRead,BufNewFile *.rabl setf ruby

" Mouse for scrolling etc in console.
set mouse=a

" " Resize split panes with mouse within tmux.
" " Also get live-updated text selection with mouse drag.
set ttymouse=xterm2

map <Leader>V :e $MYVIMRC<CR> " Open Vimrc on a whim
map <Leader>p :set paste!<CR> " Paste stuff like a boss
nnoremap "p :reg<CR> " Show me the clipboard registry already!
map <Leader>\ :vsp<CR> " Open a split window on the right
map <Leader>- :sp<CR> " Open a split window bottom
map <Leader>w <C-w>w " Cycle between windows
map <Leader>q :q<CR> " Quit a Window
map <Leader>f :NERDTreeFind<CR> " Show the current file in Nerdtree
nnoremap <Leader>i ggVG=``

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

"Run Rspec Files
nnoremap <leader>r :w\|:call VimuxRunCommand("clear && zeus rspec --format documentation ". bufname("%") . ":" . line("."))<CR>

"Git Blame
nnoremap <leader>gb :call VimuxRunCommand("git log -20 --pretty='%h %C(yellow)%an %Creset %cr: %s ' " . bufname("%") )<CR>

"Update Ctags
nnoremap <Leader>ct :!sudo bash ~/.dotfiles/ctags-auto.sh<CR>

" Fix Ctrlp root finding problem
let ctrlp_working_path_mode=''


noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <esc>:update<CR>
inoremap <silent> <C-s> <esc>:update<CR>

" Search for selected text, forwards or backwards
vnoremap <silent> * :<C-U>
      \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \ gvy/<C-R><C-R>=substitute(
      \ escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \ gV:call setreg('"', old_reg, old_regtype)<CR>
" -------------------------------------------------

" Quick Ack Word
nnoremap <Leader>a :Ack <C-r><C-w>

" Zoom in and Zoom out Vim windows
nnoremap <Leader>z :ZoomWin <CR>

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files