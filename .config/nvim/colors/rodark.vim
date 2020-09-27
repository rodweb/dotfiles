set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="rodark"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=254     ctermbg=none    cterm=none
hi Cursor          ctermfg=none    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=237     cterm=none
hi LineNr          ctermfg=241     ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=none    ctermbg=237     cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=241     ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=241     ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=none    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=1       ctermbg=none    cterm=none
hi Search          ctermfg=233     ctermbg=203     cterm=none
hi IncSearch       ctermfg=233     ctermbg=202     cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=none    ctermbg=none    cterm=none
hi StatusLineNC    ctermfg=none    ctermbg=none    cterm=none
hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=none    ctermbg=20      cterm=none
hi Visual          ctermfg=none    ctermbg=20      cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=none    ctermbg=none    cterm=none

hi Todo            ctermfg=233     ctermbg=198     cterm=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=196     ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=196     ctermbg=none    cterm=none
hi WarningMsg      ctermfg=3       ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=none       ctermbg=none    cterm=none
hi String          ctermfg=none    ctermbg=none    cterm=none
hi StringDelimiter ctermfg=none    ctermbg=none    cterm=none
hi Character       ctermfg=none    ctermbg=none    cterm=none
hi Number          ctermfg=none    ctermbg=none    cterm=none
hi Boolean         ctermfg=none    ctermbg=none    cterm=none
hi Float           ctermfg=none    ctermbg=none    cterm=none

hi Identifier      ctermfg=none    ctermbg=none    cterm=none
hi Function        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=none    ctermbg=none    cterm=none
hi Conditional     ctermfg=none    ctermbg=none    cterm=none
hi Repeat          ctermfg=none    ctermbg=none    cterm=none
hi Label           ctermfg=none    ctermbg=none    cterm=none
hi Operator        ctermfg=none    ctermbg=none    cterm=none
hi Keyword         ctermfg=241     ctermbg=none    cterm=none
hi Exception       ctermfg=none    ctermbg=none    cterm=none
hi Comment         ctermfg=198     ctermbg=none    cterm=italic

hi Special         ctermfg=none    ctermbg=none    cterm=none
hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
hi SpecialComment  ctermfg=198    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=none    ctermbg=none    cterm=none
hi Include         ctermfg=none    ctermbg=none    cterm=none
hi Define          ctermfg=none    ctermbg=none    cterm=none
hi Macro           ctermfg=none    ctermbg=none    cterm=none
hi PreCondit       ctermfg=none    ctermbg=none    cterm=none

hi Type            ctermfg=none    ctermbg=none    cterm=none
hi StorageClass    ctermfg=none    ctermbg=none    cterm=none
hi Structure       ctermfg=none    ctermbg=none    cterm=none
hi Typedef         ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=2       ctermbg=none    cterm=none
hi DiffChange      ctermfg=3       ctermbg=none    cterm=none
hi DiffDelete      ctermfg=196     ctermbg=none    cterm=none
hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=none    cterm=none
hi PmenuSel        ctermfg=233     ctermbg=1       cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=196     ctermbg=none    cterm=underline
hi SpellCap        ctermfg=196     ctermbg=none    cterm=underline
hi SpellLocal      ctermfg=196     ctermbg=none    cterm=none
hi SpellRare       ctermfg=196     ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------

hi GenericValue ctermfg=1
hi link String                          GenericValue        
hi link StringDelimiter                 GenericValue        
hi link Character                       GenericValue        
hi link Number                          GenericValue        
hi link Boolean                         GenericValue        
hi link Float                           GenericValue        

" --------------------------------
" GitGutter
" --------------------------------
hi link GitGutterAdd                    DiffAdd
hi link GitGutterChange                 DiffChange
hi link GitGutterDelete                 DiffDelete
hi link GitGutterChangeDelete           DiffDelete

hi link diffAdded                       DiffAdd
hi link diffRemoved                     DiffDelete

" --------------------------------
" Typescript
" --------------------------------
hi link typescriptAbstract              Keyword
hi link typescriptExport                Keyword
hi link typescriptImport                Keyword
hi link typescriptCastKeyword           Keyword

hi link typescriptProp                  Normal
hi link typescriptBlock                 Normal
hi link typescriptClassBlock            Normal
hi link typescriptStringMethod          Normal
hi link typescriptDOMFormProp           Normal
hi link typescriptES6SetMethod          Normal
hi link typescriptJSONStaticMethod      Normal
hi link typescriptFuncCallArg           Normal
hi link typescriptPaymentShippingOptionProp Normal

hi Types ctermfg=8
hi link typescriptTypeReference         Types
hi link typescriptPredefinedType        Types
