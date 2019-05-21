" chestnut.vim - Vim color scheme for 16-color terminals
" --------------------------------------------------------------
" Author - NerdyPepper
" --------------------------------------------------------------

" Scheme setup {{{
set background=dark
hi! clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="chestnut"

"}}}
" Vim UI {{{
hi Cursor              ctermfg=NONE  ctermbg=NONE
hi CursorLine          ctermbg=NONE  cterm=NONE
hi MatchParen          ctermfg=14    ctermbg=15    cterm=NONE
hi Pmenu               ctermfg=1     ctermbg=6
hi PmenuThumb          ctermbg=9
hi PmenuSBar           ctermbg=9
hi PmenuSel            ctermfg=0     ctermbg=6
hi ColorColumn         ctermbg=0
hi SpellBad            ctermfg=1     ctermbg=NONE  cterm=underline
hi SpellCap            ctermfg=10    ctermbg=11	   cterm=underline
hi SpellRare           ctermfg=7     ctermbg=NONE  cterm=underline
hi SpellLocal          ctermfg=12    ctermbg=NONE  cterm=underline
hi NonText             ctermfg=1
hi LineNr              ctermfg=1     ctermbg=6
hi CursorLineNr        ctermfg=0     ctermbg=6     cterm=bold
hi Visual              ctermfg=0     ctermbg=1
hi IncSearch           ctermfg=10     ctermbg=11    cterm=NONE
hi Search              ctermfg=10     ctermbg=11
hi StatusLine          ctermfg=0     ctermbg=6    cterm=NONE
hi StatusLineNC        ctermfg=0     ctermbg=7     cterm=NONE
hi VertSplit           ctermfg=6     ctermbg=6     cterm=NONE
hi TabLine             ctermfg=1     ctermbg=6     cterm=NONE
hi TabLineSel          ctermfg=10    ctermbg=11     cterm=NONE
hi Folded              ctermfg=3     ctermbg=0
hi Directory           ctermfg=3    ctermbg=7
hi Title               ctermfg=3     cterm=bold
hi ErrorMsg            ctermfg=14    ctermbg=15
hi DiffAdd             ctermfg=10    ctermbg=7
hi DiffChange          ctermfg=12    ctermbg=7
hi DiffDelete          ctermfg=14    ctermbg=7
hi! link GitGutterAdd     DiffAdd
hi! link GitGutterChange  DiffChange
hi! link GitGutterDelete  DiffDelete

hi User1               ctermfg=14    ctermbg=5
hi User2               ctermfg=14    ctermbg=9
hi User3               ctermfg=14    ctermbg=3
hi User4               ctermfg=14    ctermbg=0
hi User5               ctermfg=14    ctermbg=12
hi User1               ctermfg=14    ctermbg=15
hi User7               ctermfg=14    ctermbg=13
hi User9               ctermfg=14    ctermbg=10
hi User8               ctermfg=14    ctermbg=9
hi! link CursorColumn  CursorLine
hi  SignColumn    	   ctermbg=7
hi! link WildMenu      Visual
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg       Title
hi! link Question      MoreMsg
hi! link ModeMsg       MoreMsg
hi! link TabLineFill   StatusLineNC
hi! link SpecialKey    NonText

"}}}
" Generic syntax {{{
hi Delimiter       ctermfg=12  ctermbg=13    cterm=NONE
hi Comment         ctermfg=14  ctermbg=15     cterm=NONE
hi Underlined      ctermfg=4   cterm=underline
hi Type            ctermfg=0
hi String          ctermfg=10  ctermbg=11
hi Keyword         ctermfg=12  ctermbg=13
hi Todo            ctermfg=12  ctermbg=13
hi Function        ctermfg=8   ctermbg=9    cterm=NONE
hi Identifier      ctermfg=12  ctermbg=13   cterm=NONE
hi Statement       ctermfg=8 ctermbg=9   cterm=NONE
hi Constant        ctermfg=12
hi Number          ctermfg=12 ctermbg=13
hi Boolean         ctermfg=4
hi Special         ctermfg=12
hi Ignore          ctermfg=0
hi! link Operator  Delimiter
hi PreProc   ctermfg=0  cterm=bold
hi! link Error     ErrorMsg

"}}}
" HTML {{{
hi htmlTagName              ctermfg=8	ctermbg=9
hi htmlTag                  ctermfg=3
hi htmlArg                  ctermfg=0 	cterm=italic
hi htmlH1                   cterm=bold
hi htmlBold                 cterm=bold
hi htmlItalic               cterm=underline
hi htmlUnderline            cterm=underline
hi htmlBoldItalic           cterm=bold,underline
hi htmlBoldUnderline        cterm=bold,underline
hi htmlUnderlineItalic      cterm=underline
hi htmlBoldUnderlineItalic  cterm=bold,underline
hi htmlLink           		ctermfg=12 ctermbg=13 cterm=underline
hi! link htmlEndTag         htmlTag

"}}}
" XML {{{
hi xmlTagName       ctermfg=0
hi xmlTag           ctermfg=12  ctermbg=13
hi! link xmlString  xmlTagName
hi! link xmlAttrib  xmlTag
hi! link xmlEndTag  xmlTag
hi! link xmlEqual   xmlTag

"}}}
" JavaScript {{{
hi! link javaScript        Normal
hi! link javaScriptBraces  Delimiter

"}}}
" PHP {{{
hi phpSpecialFunction    ctermfg=14 ctermbg=15
hi phpIdentifier         ctermfg=8  ctermbg=9
hi! link phpVarSelector  phpIdentifier
hi! link phpHereDoc      String
hi! link phpDefine       Statement

"}}}
" Markdown {{{
hi! link markdownHeadingRule        NonText
hi! link markdownHeadingDelimiter   markdownHeadingRule
hi! link markdownLinkDelimiter      Delimiter
hi! link markdownURLDelimiter       Delimiter
hi! link markdownCodeDelimiter      NonText
hi! link markdownLinkTextDelimiter  markdownLinkDelimiter
hi! link markdownUrl                markdownLinkText
hi! link markdownAutomaticLink      markdownLinkText
hi! link markdownCodeBlock          String
hi markdownCode                     cterm=bold
hi markdownBold                     cterm=bold
hi markdownItalic                   cterm=italic

"}}}
" Ruby {{{
hi! link rubyDefine                 Statement
hi! link rubyLocalVariableOrMethod  Identifier
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Number
hi! link rubyStringDelimiter        rubyString

"}}}
" Git {{{
hi gitCommitBranch               ctermfg=3
hi gitCommitSelectedType         ctermfg=11
hi gitCommitSelectedFile         ctermfg=2
hi gitCommitUnmergedType         ctermfg=8
hi gitCommitUnmergedFile         ctermfg=6
hi! link gitCommitFile           Directory
hi! link gitCommitUntrackedFile  gitCommitUnmergedFile
hi! link gitCommitDiscardedType  gitCommitUnmergedType
hi! link gitCommitDiscardedFile  gitCommitUnmergedFile

"}}}
" Vim {{{
hi! link vimSetSep    Delimiter
hi! link vimContinue  Delimiter
hi! link vimHiAttrib  Constant

"}}}
" LESS {{{
hi lessVariable             ctermfg=10  ctermbg=11
hi! link lessVariableValue  Normal

"}}}
" NERDTree {{{
hi! link NERDTreeHelp      Comment
hi! link NERDTreeExecFile  String
hi NERDTreeDirSlash    	   ctermfg=0

"}}}
" Vimwiki {{{
hi! link VimwikiHeaderChar  markdownHeadingDelimiter
hi! link VimwikiList        markdownListMarker
hi! link VimwikiCode        markdownCode
hi! link VimwikiCodeChar    markdownCodeDelimiter

"}}}
" Help {{{
hi! link helpExample         String
hi! link helpHeadline        Number
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined

"}}}
" CtrlP {{{
hi! link CtrlPMatch    String
hi! link CtrlPLinePre  Comment

"}}}
" Mustache {{{
hi mustacheSection           ctermfg=14  ctermbg=15
hi mustacheMarker            ctermfg=0
hi mustacheVariable          ctermfg=8   ctermbg=9
hi mustacheVariableUnescape  ctermfg=10  ctermbg=11
hi mustachePartial           ctermfg=12  ctermbg=13

"}}}
" Shell {{{
hi shDerefSimple     ctermfg=10
hi! link shDerefVar  shDerefSimple

"}}}
" Syntastic {{{
hi SyntasticWarningSign  ctermfg=3   ctermbg=NONE
hi SyntasticErrorSign    ctermfg=6   ctermbg=NONE

"}}}
" Netrw {{{
hi netrwExe       ctermfg=8
hi netrwClassify  ctermfg=9  cterm=bold

"}}}

" vim: fdm=marker:sw=2:sts=2:et
