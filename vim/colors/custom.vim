" Vim color file

" Reset background colors
hi clear Normal
set bg&

" Remove all existing highlighting
hi clear

" Load syntax defaults
if exists('syntax_on')
  syntax reset
endif

" Set colorscheme name
let g:colors_name = 'custom'

" GUI elements
hi LineNr ctermfg=darkgrey
hi Pmenu ctermfg=lightgrey ctermbg=darkgrey
hi PmenuSel ctermfg=white ctermbg=grey

hi ErrorMsg ctermfg=red ctermbg=none cterm=underline
hi WarningMsg ctermfg=blue ctermbg=none cterm=underline

" Code
hi Normal ctermfg=lightgrey
hi Comment ctermfg=darkgrey
hi Special ctermfg=green

hi Constant ctermfg=red cterm=italic
hi String ctermfg=yellow cterm=italic

hi Identifier ctermfg=blue cterm=none
hi Function ctermfg=lightgrey cterm=bold

hi Type ctermfg=magenta
hi Statement ctermfg=blue cterm=bold
hi PreProc ctermfg=green

" Title
hi Title ctermfg=lightgreen

" Visual
hi Visual ctermfg=black ctermbg=lightgrey
hi Search cterm=underline ctermfg=cyan ctermbg=none
hi IncSearch cterm=underline ctermfg=cyan ctermbg=none
hi Folded ctermfg=darkgrey ctermbg=none

" Other
hi Underlined ctermfg=blue cterm=underline
hi Todo ctermfg=yellow ctermbg=none cterm=underline
hi SpellCap ctermfg=blue ctermbg=none cterm=underline
hi Error ctermfg=red ctermbg=none cterm=underline
hi SpellBad ctermfg=red ctermbg=none cterm=underline

" GitGutter
hi GitGutterAdd ctermfg=green
hi GitGutterChange ctermfg=yellow
hi GitGutterDelete ctermfg=red
