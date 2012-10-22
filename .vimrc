set encoding=utf-8 nobomb

" Enable syntax highlighting
set term=xterm-256color
syntax on
colors mine

" Make vim more useful
set nocompatible

" Use UTF-8 without BOM
set fileencodings=ucs-bom,utf-8,latin1
" Don’t add empty newlines at the end of files
set binary
set noeol

" Automatically indent (on new line etc.)
set formatoptions=tcqw
set autoindent
set smartindent " automaticall indent according to block

" Make tabs as wide as two spaces
set tabstop=2
" use spaces instead of tabs
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set showbreak=↪
set list

"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

" Highlight current line
set cursorline
" Enable line numbers
set number
" Show the cursor position
set ruler

" Character for CLI expansion (TAB-completion).
set wildchar=<TAB>
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
" Hitting TAB in command mode will show possible completions above command line.
set wildmenu
" Complete only until point of ambiguity.
set wildmode=list:longest

" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Change mapleader
let mapleader=","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Start scrolling three lines before the horizontal window border
set scrolloff=3

set encoding=default
