" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=2 sw=2
" Vim color file

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "azure"

hi Normal         ctermfg=252
hi Delimiter      ctermfg=63
hi Number         ctermfg=180
hi String         ctermfg=210
hi Constant       ctermfg=217            term=underline
hi Comment        ctermfg=242 cterm=bold term=bold
hi SpecialComment ctermfg=243 cterm=bold term=bold
hi Identifier     ctermfg=42  cterm=bold term=underline
hi Statement      ctermfg=75  cterm=bold term=bold
hi PreProc        ctermfg=41  cterm=bold term=underline
hi Type           ctermfg=33  cterm=bold term=underline
hi Function       ctermfg=252 cterm=bold term=bold
hi Repeat         ctermfg=252 cterm=bold term=bold
hi Ignore         ctermfg=241 cterm=bold

hi Error          ctermfg=235 ctermbg=204 term=reverse
hi Todo           ctermfg=0   ctermbg=125 term=standout
hi LineNr         ctermfg=240
hi Folded         ctermfg=235 ctermbg=242 term=standout
hi DiffAdd        ctermfg=41  ctermbg=22
hi DiffDelete     ctermfg=167 ctermbg=52
hi DiffChange     ctermbg=none
hi DiffText       ctermbg=none

hi link Operator       Delimiter
hi link Character      String
hi link Label          Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Boolean        Constant
hi link SpecialChar    Constant
hi link Float          Number
hi link Conditional    Repeat
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Special        Normal
hi link Tag            Special
hi link Debug          Special
