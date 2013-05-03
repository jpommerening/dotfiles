" Enable syntax highlighting
set term=xterm-256color
syntax on
filetype on
filetype plugin on
colors mine

" Make vim more useful
set nocompatible

set modeline
set modelines=5

" Use UTF-8 without BOM
set fileencodings=ucs-bom,utf-8,latin1
" Do not add empty newlines at the end of files
" set binary
set noeol

" Automatically indent (on new line etc.)
set formatoptions=tcqw
set autoindent
set smartindent " automaticall indent according to block

" Check environment variable
if strlen($INDENT)
  " .. to adjust tabbing.
  exe printf("set tabstop=%i softtabstop=%i shiftwidth=%i", $INDENT, $INDENT, $INDENT)
else
  " Make tabs as wide as two spaces
  set tabstop=2 softtabstop=2 shiftwidth=2
endif

" use spaces instead of tabs
set expandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown setlocal spell

if &encoding == 'utf-8'
  " Show invisible characters
  set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  set showbreak=↪
  set list
endif
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
" Enable mouse normal and visial mode (not in insert mode!)
set mouse=nv
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

" pathogen
call pathogen#infect()

" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_camel_case_completion=1

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0
let g:syntastic_enable_highlighting=1

" slimv/lisp
let g:lisp_rainbow=1
" let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load $HOME/.vim/bundle/slimv/slime/start-swank.lisp\""' 

" powerline
let g:Powerline_symbols='compatible'

" if &encoding == 'utf-8'
"   let g:Powerline_symbols='fancy'
" ele
"   let g:Powerline_symbols='compatible'
" endif
