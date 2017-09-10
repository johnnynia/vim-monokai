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


let s:lightblack  = { "gui": "#000000", "cterm": "235" }
let s:lightblack2 = { "gui": "#000000", "cterm": "236" }
let s:darkblack   = { "gui": "#000000", "cterm": "233" }
let s:lightgrey   = { "gui": "#666666", "cterm": "237" }
let s:warmgrey    = { "gui": "#999999", "cterm": "239" }



let s:realblack   = { "gui": "#000000", "cterm": "232" }
let s:black       = { "gui": "#000000", "cterm": "0" }

let s:red         = { "gui": "#ffffff", "cterm": "1" }
let s:green       = { "gui": "#ffffff", "cterm": "2" }
let s:yellow      = { "gui": "#ffffff", "cterm": "3" }
let s:blue        = { "gui": "#ffffff", "cterm": "4" }
let s:pink        = { "gui": "#ffffff", "cterm": "5" }
let s:aqua        = { "gui": "#ffffff", "cterm": "6" }

let s:grey        = { "gui": "#ffffff", "cterm": "7" }
let s:darkgrey    = { "gui": "#999999", "cterm": "8" }

let s:darkred     = { "gui": "#ffffff", "cterm": "9" }
let s:darkgreen   = { "gui": "#ffffff", "cterm": "10" }
let s:darkyellow  = { "gui": "#ffffff", "cterm": "11" }
let s:darkblue    = { "gui": "#ffffff", "cterm": "12" }
let s:darkpink    = { "gui": "#ffffff", "cterm": "13" }
let s:darkaqua    = { "gui": "#ffffff", "cterm": "14" }

let s:white       = { "gui": "#ffffff", "cterm": "15" }


let s:orange      = { "gui": "#ffffff", "cterm": "11" }
let s:purple      = { "gui": "#ffffff", "cterm": "13" }


let s:addfg       = { "gui": "#ffffff", "cterm": "252" }
let s:addbg       = { "gui": "#ffffff", "cterm": "10" }
let s:delbg       = { "gui": "#ffffff", "cterm": "9" }
let s:changefg    = { "gui": "#ffffff", "cterm": "252" }
let s:changebg    = { "gui": "#ffffff", "cterm": "3" }

" Highlighting 
" ------------

" editor
call s:h("Normal",        { "fg": s:white,      "bg": s:black })
call s:h("ColorColumn",   {                     "bg": s:lightblack })
call s:h("CursorColumn",  {                     "bg": s:lightblack2 })
call s:h("CursorLine",    {                     "bg": s:lightblack })
call s:h("NonText",       { "fg": s:lightgrey,  "bg": s:black })
call s:h("StatusLine",    { "fg": s:realblack,   "bg": s:realblack })
call s:h("StatusLineNC",  { "fg": s:darkgrey,   "bg": s:realblack })
call s:h("TabLine",       { "fg": s:white,      "bg": s:darkblack,    "format": "reverse" })
call s:h("Visual",        {                     "bg": s:lightgrey })
call s:h("Search",        { "fg": s:black,      "bg": s:yellow })
call s:h("MatchParen",    { "fg": s:black,      "bg": s:purple })
call s:h("Question",      { "fg": s:yellow })
call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:yellow })
call s:h("ErrorMsg",      { "fg": s:black,      "bg": s:red,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:red })
call s:h("VertSplit",     { "fg": s:realblack,  "bg": s:realblack })
call s:h("LineNr",        { "fg": s:grey,       "bg": s:black })
call s:h("CursorLineNr",  { "fg": s:white,      "bg": s:lightblack })
call s:h("EndOfBuffer",   { "fg": s:black,      "bg": s:black })
call s:h("SignColumn",    {                     "bg": s:lightblack })

" misc
call s:h("SpecialKey",    { "fg": s:red })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:aqua })

" diff
call s:h("DiffAdd",       { "fg": s:black,      "bg": s:green })
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:red })
call s:h("DiffChange",    { "fg": s:black,      "bg": s:blue })
call s:h("DiffText",      { "fg": s:black,      "bg": s:blue })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack })
call s:h("FoldColumn",    {                     "bg": s:darkblack })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:lightblack, "bg": s:white })
call s:h("PmenuSel",      { "fg": s:aqua,       "bg": s:black,        "format": "reverse,bold" })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:grey })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:blue })
call s:h("Number",        { "fg": s:red })
call s:h("Float",         { "fg": s:red })
call s:h("Boolean",       { "fg": s:red })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:green })

call s:h("Type",          { "fg": s:aqua })
call s:h("Structure",     { "fg": s:aqua })
call s:h("StorageClass",  { "fg": s:aqua })
call s:h("Typedef",       { "fg": s:aqua })
    
call s:h("Identifier",    { "fg": s:yellow })
call s:h("Function",      { "fg": s:green })
                         
call s:h("Statement",     { "fg": s:red })
call s:h("Operator",      { "fg": s:red })
call s:h("Label",         { "fg": s:red })
call s:h("Keyword",       { "fg": s:aqua })
call s:h("Conditional",   { "fg": s:red })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:red })
call s:h("Define",        { "fg": s:blue })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })
                           
call s:h("Special",       { "fg": s:purple })
call s:h("SpecialChar",   { "fg": s:red })
call s:h("Delimiter",     { "fg": s:white })
call s:h("SpecialComment",{ "fg": s:aqua })
call s:h("Tag",           { "fg": s:red })
"        Debug"

call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:warmgrey, "format": "italic" })
                         
call s:h("Underlined",    { "fg": s:green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:red, "bg": s:darkred })

" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:blue })
call s:h("NERDTreeClosable",        { "fg": s:grey })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:red })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:grey })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:white })
call s:h("NERDTreeDir",             { "fg": s:blue })
call s:h("NERDTreeExecFile",        { "fg": s:green })

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:red })

" Vim command
call s:h("vimCommand",              { "fg": s:blue })

" Javascript
call s:h("jsFuncName",          { "fg": s:green })
call s:h("jsThis",              { "fg": s:red })
call s:h("jsFunctionKey",       { "fg": s:green })
call s:h("jsPrototype",         { "fg": s:aqua })
call s:h("jsExceptions",        { "fg": s:aqua })
call s:h("jsFutureKeys",        { "fg": s:aqua })
call s:h("jsBuiltins",          { "fg": s:aqua })
call s:h("jsArgsObj",           { "fg": s:aqua })
call s:h("jsStatic",            { "fg": s:aqua })
call s:h("jsSuper",             { "fg": s:aqua })
call s:h("jsFuncArgRest",       { "fg": s:purple, "format": "italic" })                                 
call s:h("jsFuncArgs",          { "fg": s:orange, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:aqua })
call s:h("jsDocTags",           { "fg": s:aqua,   "format": "italic" })
                                 
" Html
call s:h("htmlTag",             { "fg": s:green })
call s:h("htmlEndTag",          { "fg": s:green })
call s:h("htmlTagName",         { "fg": s:red })
call s:h("htmlArg",             { "fg": s:darkblue })
call s:h("htmlSpecialChar",     { "fg": s:purple })
call s:h("htmlH1",              { "fg": s:red })

" Markdown
call s:h("markdownError",       { "fg": s:white, "bg": s:black, "format": "" })
call s:h("markdownH1",          { "fg": s:blue })
call s:h("markdownH2",          { "fg": s:green })
call s:h("markdownH3",          { "fg": s:blue })
call s:h("markdownH4",          { "fg": s:red })
call s:h("markdownHeadingDelimiter", { "fg": s:grey })
call s:h("markdownHeadingRule", { "fg": s:grey })
call s:h("markdownLinkDelimiter", { "fg": s:white })
call s:h("markdownLinkText",    { "fg": s:white,   "format": "underline" })
call s:h("markdownLinkTextDelimiter", { "fg": s:grey })
call s:h("markdownListMarker",  { "fg": s:grey })
call s:h("markdownUrl",         { "fg": s:grey })

" Xml
call s:h("xmlTag",              { "fg": s:red })
call s:h("xmlEndTag",           { "fg": s:red })
call s:h("xmlTagName",          { "fg": s:orange })
call s:h("xmlAttrib",           { "fg": s:green })

" CSS
call s:h("cssAttrComma",        { "fg": s:white })
call s:h("cssBraces",           { "fg": s:white })
call s:h("cssClassName",        { "fg": s:yellow })
call s:h("cssClassNameDot",     { "fg": s:red })
call s:h("cssColor",            { "fg": s:red })
call s:h("cssCommonAttr",       { "fg": s:blue })
call s:h("cssFunctionName",     { "fg": s:blue })
call s:h("cssImportant",        { "fg": s:blue })
call s:h("cssProp",             { "fg": s:white })
call s:h("cssPseudoClassId",    { "fg": s:blue })
call s:h("cssTagName",          { "fg": s:yellow })
call s:h("cssTextAttr",         { "fg": s:blue })
call s:h("cssUIAttr",           { "fg": s:blue })
call s:h("cssURL",              { "fg": s:green, "format": "underline,italic" })
call s:h("cssValueLength",      { "fg": s:red })
call s:h("cssValueNumber",      { "fg": s:red })

" SASS
call s:h("sassAmpersand",       { "fg": s:red })
call s:h("sassClass",           { "fg": s:yellow })
call s:h("sassClassChar",       { "fg": s:yellow })
call s:h("sassCssAttribute",    { "fg": s:blue })
call s:h("sassIdChar",          { "fg": s:yellow })
call s:h("sassInclude",         { "fg": s:white })
call s:h("sassMixin",           { "fg": s:red })
call s:h("sassMixing",          { "fg": s:red })
call s:h("sassMixinName",       { "fg": s:green })

" CoffeeScript
call s:h("coffeeBracket",       { "fg": s:white })
call s:h("coffeeExtendedOp",    { "fg": s:white })
call s:h("coffeeInterpDelim",   { "fg": s:red })
call s:h("coffeeObjAssign",     { "fg": s:yellow })
call s:h("coffeeObject",        { "fg": s:blue })
call s:h("coffeeParen",         { "fg": s:white })
call s:h("coffeeParens",        { "fg": s:white })
call s:h("coffeeSpecialVar",    { "fg": s:red })

" LESS
call s:h("lessVariable",        { "fg": s:green })

" Vim
call s:h("vimGroup",            { "fg": s:white })
call s:h("vimHiCterm",          { "fg": s:white })
call s:h("vimHiCtermFgBg",      { "fg": s:white })
call s:h("vimHiGroup",          { "fg": s:white })

" PHP


" ruby
call s:h("rubyBlockArgument",           { "fg": s:yellow })
call s:h("rubyBlockParameter",          { "fg": s:yellow })
call s:h("rubyClass",                   { "fg": s:darkblue })
call s:h("rubyClassVariable",           {})
call s:h("rubyConstant",                { "fg": s:blue })
call s:h("rubyControl",                 { "fg": s:darkblue })
call s:h("rubyDefine",                  { "fg": s:darkblue })
call s:h("rubyEscape",                  { "fg": s:purple })
call s:h("rubyException",               { "fg": s:red })
call s:h("rubyFunction",                { "fg": s:blue })
call s:h("rubyGlobalVariable",          {})
call s:h("rubyInclude",                 { "fg": s:red })
call s:h("rubyInstanceVariable",        { "fg": s:yellow })
call s:h("rubyInterpolationDelimiter",  { "fg": s:red })
call s:h("rubyKeywordAsMethod",         { "fg": s:yellow })
call s:h("rubyOperator",                { "fg": s:red })
call s:h("rubyPseudoVariable",          {})
call s:h("rubyRailsARAssociationMethod",{ "fg": s:yellow })
call s:h("rubyRailsARMethod",           { "fg": s:yellow })
call s:h("rubyRailsMethod",             { "fg": s:white })
call s:h("rubyRailsRenderMethod",       { "fg": s:red })
call s:h("rubyRegexp",                  { "fg": s:yellow })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
call s:h("rubyStringDelimiter",         { "fg": s:white })
call s:h("rubySymbol",                  { "fg": s:red })

" call s:h("rubyBlock",                   { "fg": s:grey })
" call s:h("rubyMethodBlock",             { })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:aqua })

" c
call s:h("cLabel",                      { "fg": s:red })
call s:h("cStructure",                  { "fg": s:red })
call s:h("cStorageClass",               { "fg": s:red })
call s:h("cInclude",                    { "fg": s:green })
call s:h("cDefine",                     { "fg": s:green })

" dosini
call s:h("dosiniHeader",                { "fg": s:blue })
call s:h("dosiniLabel",                 { "fg": s:white })
call s:h("dosiniNumber",                { "fg": s:white })

" Slim
call s:h("slimClass",                   { "fg": s:yellow })
call s:h("slimClassChar",               { "fg": s:yellow })
call s:h("slimRuby",                    { "fg": s:blue })
call s:h("slimRubyChar",                { "fg": s:blue })
call s:h("slimRubyOutputChar",          { "fg": s:blue })
call s:h("slimText",                    { "fg": s:white })

" i3
call s:h("i3KeyModifier",               { "fg": s:yellow })
