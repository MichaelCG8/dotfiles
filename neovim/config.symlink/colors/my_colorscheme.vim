" This is an extension of the builtin slate colorscheme.

hi clear
if exists("syntax_on")
    syntax reset
endif

runtime colors/slate.vim

let g:colors_name = "my_colorscheme"

hi clear CursorLine
hi CursorLine ctermfg=NONE ctermbg=237  " x237_Grey23 #3a3a3a
