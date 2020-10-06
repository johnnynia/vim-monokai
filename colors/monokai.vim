" File:       monokai.vim
" Maintainer: Crusoe Xia (crusoexia)
" URL:        https://github.com/crusoexia/vim-monokai
" License:    MIT
"
" The colour palette is from http://www.colourlovers.com/
" The original code is from https://github.com/w0ng/vim-hybrid

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:monokai_gui_italic")
    let g:monokai_gui_italic = 1
endif

if ! exists("g:monokai_term_italic")
    let g:monokai_term_italic = 0
endif

let g:monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:monokai_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:monokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------


let s:white2  = { "gui": "#000000", "cterm": "236" }
let s:lightgrey    = { "gui": "#666666", "cterm": "237" }
let s:warmgrey     = { "gui": "#999999", "cterm": "239" }
let s:realblack    = { "gui": "#000000", "cterm": "232" }


let s:black        = { "gui": "#000000", "cterm": "0" }

let s:red          = { "gui": "#ffffff", "cterm": "1" }
let s:green        = { "gui": "#ffffff", "cterm": "2" }
let s:yellow       = { "gui": "#ffffff", "cterm": "3" }
let s:blue         = { "gui": "#ffffff", "cterm": "4" }
let s:pink         = { "gui": "#ffffff", "cterm": "5" }
let s:aqua         = { "gui": "#ffffff", "cterm": "6" }

let s:white        = { "gui": "#ffffff", "cterm": "7" }
let s:brightblack  = { "gui": "#999999", "cterm": "8" }
let s:grey         = { "gui": "#ffffff", "cterm": "8" }

let s:brightred    = { "gui": "#ffffff", "cterm": "9" }
let s:brightgreen  = { "gui": "#ffffff", "cterm": "10" }
let s:brightyellow = { "gui": "#ffffff", "cterm": "11" }
let s:brightblue   = { "gui": "#ffffff", "cterm": "12" }
let s:brightpink   = { "gui": "#ffffff", "cterm": "13" }
let s:brightaqua   = { "gui": "#ffffff", "cterm": "14" }

let s:brightwhite  = { "gui": "#ffffff", "cterm": "15" }


let s:purple       = { "gui": "#ffffff", "cterm": "13" }




" Highlighting
" ------------
" let s:constant = s:pink
let s:constant = s:pink
" let s:function = s:blue
let s:function = s:yellow
let s:string = s:green
let s:search = s:yellow
let s:structure = s:blue
let s:warning = s:red
let s:meta = s:aqua
let s:args = s:brightyellow
let s:special = s:brightpink
let s:variable = s:pink


" editor
call s:h("Normal",        {  "fg": s:brightwhite, "bg": s:black })
call s:h("ColorColumn",   {                     "bg": s:white })
call s:h("CursorColumn",  {                     "bg": s:black })
call s:h("CursorLine",    {                     "bg": s:brightblack })
call s:h("NonText",       { "fg": s:white,      "bg": s:search })
call s:h("StatusLine",    { "fg": s:black,      "bg": s:black })
call s:h("StatusLineNC",  { "fg": s:black,      "bg": s:black })
call s:h("TabLine",       { "fg": s:search,     "bg": s:black })
call s:h("Visual",        {                     "bg": s:lightgrey })
call s:h("Search",        { "fg": s:black,      "bg": s:search })
call s:h("MatchParen",    { "bg": s:white })
call s:h("Question",      { "fg": s:search })
call s:h("ModeMsg",       { "fg": s:search })
call s:h("MoreMsg",       { "fg": s:search })
call s:h("ErrorMsg",      { "fg": s:black,      "bg": s:warning,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:warning })
call s:h("VertSplit",     { "fg": s:brightblack })
call s:h("LineNr",        { "fg": s:brightblack })
call s:h("CursorLineNr",  { "fg": s:brightwhite })
call s:h("EndOfBuffer",   { "fg": s:black })
call s:h("SignColumn",    {                      })
call s:h("Conceal",       { "fg": s:search,     "bg": s:black })

" misc
call s:h("SpecialKey",    { "fg": s:warning })
call s:h("Title",         { "fg": s:pink })
call s:h("Directory",     { "fg": s:meta })

" diff
call s:h("DiffAdd",       { "fg": s:black,      "bg": s:string })
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:warning })
call s:h("DiffChange",    { "fg": s:black,      "bg": s:search })
call s:h("DiffText",      { "fg": s:black,      "bg": s:function })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:black })
call s:h("FoldColumn",    {                     "bg": s:black })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:black, "bg": s:brightwhite })
call s:h("PmenuSel",      { "fg": s:black, "bg": s:string })
call s:h("PmenuThumb",    { "fg": s:white,       "bg": s:grey })
"        PmenuSbar"


" Generic Syntax Highlighting
" ---------------------------
call s:h("Comment",       { "fg": s:white })

call s:h("Constant",      { "fg": s:constant })
call s:h("String",        { "fg": s:string })
call s:h("Character",     { "fg": s:string })
call s:h("Number",        { "fg": s:constant })
call s:h("Boolean",       { "fg": s:search })
call s:h("Float",         { "fg": s:search })

call s:h("Identifier",    { "fg": s:constant })
call s:h("Function",      { "fg": s:function })

call s:h("Statement",     { "fg": s:brightwhite })
call s:h("Conditional",   { "fg": s:structure })
call s:h("Repeat",        { "fg": s:structure })
call s:h("Label",         { "fg": s:brightwhite })
call s:h("Operator",      { "fg": s:brightwhite })
call s:h("Keyword",       { "fg": s:structure })
call s:h("Exception",     { "fg": s:structure })

call s:h("PreProc",       { "fg": s:string })
call s:h("Include",       { "fg": s:special })
call s:h("Define",        { "fg": s:structure })
call s:h("Macro",         { "fg": s:structure })
call s:h("PreCondit",     { "fg": s:string })

call s:h("Type",          { "fg": s:pink })
call s:h("Structure",     { "fg": s:aqua })
call s:h("StorageClass",  { "fg": s:white })
call s:h("Typedef",       { "fg": s:constant })

call s:h("Special",       { "fg": s:special })
call s:h("SpecialChar",   { "fg": s:warning })
call s:h("Tag",           { "fg": s:search })
call s:h("Delimiter",     { "fg": s:brightwhite })
call s:h("SpecialComment",{ "fg": s:meta })
call s:h("Debug",         { "fg": s:meta })

call s:h("Underlined",    { "fg": s:string })

call s:h("Ignore",        {})

call s:h("Error",         { "fg": s:warning })

call s:h("Todo",          { "fg": s:args,   "format": "bold,italic" })



" Plugins ----------------------------------------------------------------------


" NerdTree ---------------------------------------------------------------------
call s:h("NERDTreeOpenable",        { "fg": s:white })
call s:h("NERDTreeClosable",        { "fg": s:brightwhite })
call s:h("NERDTreeHelp",            { "fg": s:search })
call s:h("NERDTreeBookmarksHeader", { "fg": s:warning })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:search })
call s:h("NERDTreeCWD",             { "fg": s:white })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:white })
call s:h("NERDTreeDir",             { "fg": s:blue })
call s:h("NERDTreeExecFile",        { "fg": s:green })

" ALE --------------------------------------------------------------------------
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear ALEError
highlight clear ALEWarning
call s:h("ALEErrorSign",            { "fg": s:blue })
call s:h("ALEWarningSign",          { "fg": s:white })
call s:h("SpellBad",                { "format": "bold" })
call s:h("ALEError",                { "format": "bold" })
call s:h("ALEWarning",              {  })

" CoC --------------------------------------------------------------------------
call s:h("NormalFloat",             { "bg": s:brightblack })

" CSS --------------------------------------------------------------------------
call s:h("cssBraces",   { "fg": s:white })
hi! link cssTagName htmlTagName

hi! link cssAtKeyword               Include
hi! link cssBorderProp              StorageClass
hi! link cssBoxProp                 StorageClass
hi! link cssColorProp               StorageClass
hi! link cssComment                 StorageClass
hi! link cssFlexibleBoxProp         StorageClass
hi! link cssFontProp                StorageClass
hi! link cssTextProp                StorageClass
hi! link cssMediaProp               StorageClass
hi! link cssBackgroundProp          StorageClass
hi! link cssTransformProp           StorageClass
hi! link cssTransitionProp          StorageClass
hi! link cssUIProp                  StorageClass
hi! link cssPositioningProp         StorageClass
hi! link cssPageProp                StorageClass
hi! link cssPseudoClassId           Function
hi! link cssInteractProp            StorageClass
hi! link cssStyle                   Include

hi! link cssClassName               Normal
hi! link cssClassNameDot            Normal
hi! link cssIdName                  String
hi! link cssIdNameDot               Normal
hi! link cssIdentifier              String

" GitGutter --------------------------------------------------------------------
call s:h("GitGutterAdd",            { "fg": s:green })
call s:h("GitGutterChange",         { "fg": s:yellow })
call s:h("GitGutterDelete",         { "fg": s:red })
call s:h("GitGutterChangeDelete",   { "fg": s:red })

" HTML -------------------------------------------------------------------------
" hi! link htmlTag Comment
call s:h("htmlEndTag",   { "fg": s:white })
call s:h("htmlTag",   { "fg": s:white })
" call s:h("htmlArg",   { "fg": s:yellow })
" call s:h("htmlTagName",   { "fg": s:brightwhite })
hi! link htmlTagName Keyword
hi! link htmlSpecialTagName Error
hi! link htmlArg Statement
hi! link htmlH1 Title
hi! link htmlH2 Title
hi! link htmlH3 Title
hi! link htmlH4 Title
hi! link htmlH5 Title
hi! link htmlH6 Title
hi! link htmlH7 Title
call s:h("htmlH4",   { "fg": s:red })

" JS ---------------------------------------------------------------------------
hi! link JSModuleKeyword Keyword

" vim-signify
call s:h("SignifySignAdd",          { "fg": s:green })
call s:h("SignifySignChange",       { "fg": s:yellow })
call s:h("SignifySignDelete",       { "fg": s:red })
call s:h("SignifySignChangeDelete", { "fg": s:red })
call s:h("SignifySignDeleteFirstLine", { "fg": s:red })

" vim-svelte
hi! link svelteSurroundingTag htmlTag

" EasyMotion
call s:h("EasyMotionTarget",        { "fg": s:green })
call s:h("EasyMotionTarget2First",  { "fg": s:green })
call s:h("EasyMotionTarget2Second", { "fg": s:green })
call s:h("EasyMotionShade",         { "fg": s:white })
hi link EasyMotionMoveHL Search
hi link EasyMotionIncSearch Search

" SASS -------------------------------------------------------------------------
hi! link sassClass String
hi! link sassClassChar Normal
hi! link sassId String
hi! link sassIdChar Normal




" Languages --------------------------------------------------------------------


" TypeScript -------------------------------------------------------------------
hi! link typescriptEnumKeyword Statement

hi! link typescriptImport Statement
hi! link typescriptExport Statement
hi! link typescriptDefault Statement

hi! link typescriptVariable Statement


" Vim --------------------------------------------------------------------------
hi! link vimCommand Function

