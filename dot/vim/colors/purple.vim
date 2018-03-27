" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:  Ron Aaron <ron@ronware.org>
" Last Change:  2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "purple"
hi Normal      ctermfg=252
hi Comment     term=bold  cterm=bold  ctermfg=242
hi Constant    term=underline      ctermfg=141
hi Number      ctermfg=80
hi String      ctermfg=211
hi Character   ctermfg=211
hi Identifier  term=underline  cterm=bold  ctermfg=252
hi Statement   term=bold  cterm=bold  ctermfg=135
hi PreProc     term=underline  cterm=bold  ctermfg=47
hi Type        term=underline  cterm=bold  ctermfg=93
hi Function    term=bold  cterm=bold  ctermfg=252
hi Repeat      term=bold  cterm=bold  ctermfg=252
hi Operator    ctermfg=15
hi Ignore      cterm=bold
hi Error       term=reverse  ctermbg=204 ctermfg=235
hi Todo        term=standout ctermbg=125  ctermfg=0
hi LineNr      ctermfg=240
hi Folded      term=standout ctermbg=242 ctermfg=235
hi DiffAdd     ctermfg=41  ctermbg=22
hi DiffDelete  ctermfg=167 ctermbg=52
hi DiffChange  ctermbg=none
hi DiffText    ctermbg=none

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link Boolean        Constant
hi link SpecialChar    Constant
hi link Float          Number
hi link Conditional    Repeat
hi link Label          Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Special        Normal
hi link Tag            Special
hi link SpecialComment Special
hi link Debug          Special
hi link Delimiter      Constant
