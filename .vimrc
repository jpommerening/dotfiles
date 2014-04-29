" Enable syntax highlighting
set term=xterm-256color
colors mine
syntax on
filetype on
filetype plugin on

" pathogen
call pathogen#infect()

" Make vim more useful
set nocompatible

set modeline
set modelines=5

" Use UTF-8 without BOM
set fileencodings=ucs-bom,utf-8,latin1
" Do not add empty newlines at the end of files
set noeol

" Automatically indent (on new line etc.)
set formatoptions=tcqw
" automatic indent according to block
set smartindent

" Check environment variable ..
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

" spellcheck my markdown files and git commit messages
set spelllang=en
autocmd FileType markdown,gitcommit setlocal spell

if &encoding == 'utf-8'
  set list
  set listchars=tab:⇥\ ,trail:·,eol:↵,nbsp:_
  set showbreak=↪
endif

" fold based on indent
set foldmethod=syntax
" deepest fold is 10 levels
set foldnestmax=10
" don't fold by default
set nofoldenable

" Highlight current line
set cursorline
" Enable line numbers
set number

" Character for CLI expansion (TAB-completion).
set wildchar=<TAB>
" Complete only until point of ambiguity.
set wildmode=list:longest

" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Change mapleader
let mapleader=","

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

" Back to default encoding
set encoding=default

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

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'

" emmet
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall
