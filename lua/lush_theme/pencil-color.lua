--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local palette = {

  white = hsl("#eeeeee"),
  red = hsl("#af0000"),
  green = hsl("#008700"),
  light_green = hsl("#5f8700"),
  cyan = hsl("#0087af"),
  grey = hsl("#878787"),
  dark_blue = hsl("#005f87"),
  dark_grey = hsl("#444444"),
  light_grey = hsl("#bcbcbc"),
  bright_red = hsl("#d70000"),
  magenta = hsl("#d70087"),
  purple = hsl("#8700af"),
  dark_orange = hsl("#d75f00"),
  bright_orange = hsl("#ffaf00"),
  bright_blue = hsl("#005faf"),
  lime_green = hsl("#afdf00"),
  bright_purple = hsl("#af87d7"),
  bright_pink = hsl("#ff5faf"),
  bright_cyan = hsl("#00afaf")

  -- 8-bit 	24-bit 	Dark Theme 	8-bit 	24-bit
  -- 0 	#eeeeee 	255 	#eeeeee 	#1c1c1c 	234 	#1c1c1c
  -- 1 	#af0000 	124 	#af0000 	#af005f 	125 	#af005f
  -- 2 	#008700 	28 	#008700 	#5faf00 	70 	#5faf00
  -- 3 	#5f8700 	64 	#5f8700 	#d7af5f 	179 	#d7af5f
  -- 4 	#0087af 	31 	#0087af 	#5fafd7 	74 	#5fafd7
  -- 5 	#878787 	102 	#878787 	#808080 	244 	#808080
  -- 6 	#005f87 	24 	#005f87 	#d7875f 	173 	#d7875f
  -- 7 	#444444 	238 	#444444 	#d0d0d0 	252 	#d0d0d0
  -- 8 	#bcbcbc 	250 	#bcbcbc 	#585858 	240 	#585858
  -- 9 	#d70000 	160 	#d70000 	#5faf5f 	71 	#5faf5f
  -- 10 	#d70087 	162 	#d70087 	#afd700 	148 	#afd700
  -- 11 	#8700af 	91 	#8700af 	#af87d7 	140 	#af87d7
  -- 12 	#d75f00 	166 	#d75f00 	#ffaf00 	214 	#ffaf00
  -- 13 	#d75f00 	166 	#d75f00 	#ff5faf 	205 	#ff5faf
  -- 14 	#005faf 	25 	#005faf 	#00afaf 	37 	#00afaf
  -- 15 	#005f87 	24 	#005f87
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    Normal       { bg = palette.white, fg = palette.dark_grey }, -- normal text

    Comment      { fg = palette.grey, gui = "italic" }, -- any comment

    ColorColumn  { bg = Normal.bg.darken(4.0) }, -- used for the columns set with 'colorcolumn'

    Conceal      { bg = palette.light_grey, fg = palette.light_grey.darken(25) }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { gui = "reverse" }, -- character under the cursor
    lCursor      { Cursor }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|

    CursorColumn { ColorColumn }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { ColorColumn }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.

    Directory    { fg = palette.bright_blue }, -- directory names (and other special names in listings)

    DiffAdd      { fg = palette.green, bg = palette.green.lighten(80) }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = palette.dark_orange.darken(20), bg = palette.dark_orange.lighten(80) }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = palette.red, bg = palette.magenta.lighten(80) }, -- diff mode: Deleted line |diff.txt|
    DiffText     { DiffChange, gui = "bold", bg = DiffChange.bg.darken(15) }, -- diff mode: Changed text within a changed line |diff.txt|

    EndOfBuffer  { gui = "bold", fg = palette.light_grey }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    TermCursor   { Cursor }, -- cursor in a focused terminal
    ErrorMsg     { bg = palette.bright_red, fg = palette.white }, -- error messages on the command line
    VertSplit    { fg = palette.dark_grey, bg = palette.white }, -- the column separating vertically split windows

    Search       { bg = palette.light_green.rotate(-30).lighten(60), fg = Normal.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch    { bg = palette.bright_orange, fg = Normal.fg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { Search }, -- |:substitute| replacement text highlighting
    LineNr       { bg = palette.light_grey.lighten(40), fg = palette.light_grey.darken(10) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { bg = Normal.bg.lighten(10), fg = palette.dark_orange.darken(20), gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    SignColumn   { LineNr }, -- column where |signs| are displayed

    Folded       { fg = palette.cyan, bg = palette.cyan.lighten(75) }, -- line used for closed folds
    FoldColumn   { bg = LineNr.bg, fg = palette.cyan }, -- 'foldcolumn'

    MatchParen   { bg = palette.light_grey.lighten(20) }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg = palette.light_green, gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { }, -- Area for messages and cmdline
    MsgSeparator { fg = palette.white, bg = palette.grey, gui = "bold" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = palette.green, gui = "bold" }, -- |more-prompt|
    NonText      { bg = palette.white, fg = palette.light_grey, gui = "bold" }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat  { bg = palette.light_grey.lighten(50), fg = Normal.fg }, -- Normal text in floating windows.
    NormalNC     { Normal }, -- normal text in non-current windows
    Pmenu        { fg = palette.dark_grey, bg = NormalFloat.bg }, -- Popup menu: normal item.
    PmenuSel     { fg = palette.dark_grey, bg = palette.white }, -- Popup menu: selected item.
    PmenuSbar    { bg = palette.light_grey }, -- Popup menu: scrollbar.
    PmenuThumb   { bg = palette.cyan }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = palette.green, gui = "bold" }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { Search }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey   { fg = palette.light_grey }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { gui = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { SpellBad }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { SpellBad }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg = palette.grey, fg = palette.white, gui = "bold" }, -- status line of current window
    StatusLineNC { fg = palette.dark_grey, bg = palette.light_grey.lighten(40) }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    Title        { fg = palette.magenta, gui = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { fg = palette.white, bg = palette.cyan }, -- Visual mode selection
    VisualNOS    { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = palette.magenta }, -- warning messages
    Whitespace   { NonText }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { Search }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = palette.dark_orange }, -- (preferred) any constant
    String         { fg = palette.light_green }, --   a string constant: "this is a string"
    Character      { fg = palette.light_green }, --  a character constant: 'c', '\n'
    Number         { fg = palette.dark_orange }, --   a number constant: 234, 0xff
    Boolean        { fg = palette.purple, gui = "bold" }, --  a boolean constant: TRUE, false

    Float          { fg = palette.dark_orange }, --    a floating point constant: 2.3e10

    Identifier     { fg = palette.dark_blue }, -- (preferred) any variable name
    Function       { fg = palette.dark_grey }, -- function name (also: methods for classes)

    Statement      { fg = palette.magenta }, -- (preferred) any statement
    Conditional    { fg = palette.purple, gui = "bold" }, --  if, then, else, endif, switch, etc.
    Repeat         { Conditional }, --   for, do, while, etc.
    Label          { Conditional }, --    case, default, etc.
    Operator       { fg = palette.cyan }, -- "sizeof", "+", "*", etc.
    Keyword        { fg = palette.bright_blue, gui = "bold" }, --  any other keyword
    Exception      { Statement }, --  try, catch, throw

    PreProc        { fg = palette.bright_blue }, -- (preferred) generic Preprocessor
    Include        { fg = palette.bright_red, gui = "italic" }, --  preprocessor #include
    Define         { PreProc }, --   preprocessor #define
    Macro          { PreProc }, --    same as Define
    PreCondit      { fg = palette.cyan }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = palette.magenta, gui = "bold" }, -- (preferred) int, long, char, etc.
    StorageClass   { fg = palette.dark_blue, gui = "bold" }, -- static, register, volatile, etc.
    Structure      { fg = palette.bright_blue, gui = "bold" }, --  struct, union, enum, etc.
    Typedef        { Type }, --  A typedef

    Special        { fg = palette.purple.lighten(30).desaturate(50) }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    Ignore         { fg = palette.white }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error          { fg = palette.bright_red, bg = palette.magenta.lighten(80) }, -- (preferred) any erroneous construct

    Todo           { gui = "bold", fg = palette.bright_cyan }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    LspReferenceText                     { bg = Normal.bg.darken(10) }, -- used for highlighting "text" references
    LspReferenceRead                     { LspReferenceText }, -- used for highlighting "read" references
    LspReferenceWrite                    { LspReferenceText }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError           { fg = palette.bright_red }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning         { fg = palette.bright_orange.darken(10) }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation     { fg = palette.cyan.lighten(15) }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint            { fg = palette.bright_purple }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- highlighting here doesn't seem to work...
    LspDiagnosticsUnderlineError         { gui = "undercurl", sp = LspDiagnosticsDefaultError.fg }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning       { gui = "undercurl", sp = LspDiagnosticsDefaultWarning.fg }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation   { gui = "undercurl", sp = LspDiagnosticsDefaultInformation.fg }, -- Used to underline "Information" diagnostics
    -- LspDiagnosticsUnderlineHint          { gui = "undercurl", sp = LspDiagnosticsDefaultHint.fg }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    LspDiagnosticsSignError              { LspDiagnosticsDefaultError, bg = SignColumn.bg }, -- Used for "Error" signs in sign column
    LspDiagnosticsSignWarning            { LspDiagnosticsDefaultWarning, bg = SignColumn.bg }, -- Used for "Warning" signs in sign column
    LspDiagnosticsSignInformation        { LspDiagnosticsDefaultInformation, bg = SignColumn.bg }, -- Used for "Information" signs in sign column
    LspDiagnosticsSignHint               { LspDiagnosticsDefaultHint, bg = SignColumn.bg }, -- Used for "Hint" signs in sign column

    LspCodeLens                          { fg = LspDiagnosticsSignHint.fg, gui = "italic" }, -- Used to color the virtual text of the codelens

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { };    -- (unstable) TODO: docs
    -- TSBoolean            { };    -- For booleans.
    -- TSCharacter          { };    -- For characters.
    -- TSComment            { };    -- For comment blocks.
    TSConstructor        { fg = palette.purple, gui = "italic" };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- TSConditional        { };    -- For keywords related to conditionnals.
    -- TSConstant           { };    -- For constants
    -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError              { };    -- For syntax/parser errors.
    -- TSException          { };    -- For exception related keywords.
    -- TSField              { };    -- For fields.
    -- TSFloat              { };    -- For floats.
    -- TSFunction           { };    -- For function (calls and definitions).
    -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSKeyword            { };    -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { };    -- For keywords used to define a fuction.
    -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod             { };    -- For method calls and definitions.
    -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    -- TSNumber             { };    -- For all numbers
    -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
    -- TSParameter          { };    -- For parameters of a function.
    -- TSParameterReference { };    -- For references to parameters of a function.
    -- TSProperty           { };    -- Same as `TSField`.
    -- TSPunctDelimiter     { Normal };    -- For delimiters ie: `.`
    -- TSPunctBracket       { Normal };    -- For brackets and parens.
    -- TSPunctSpecial       {  };    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat             { };    -- For keywords related to loops.
    TSString             { String };    -- For strings.
    TSStringRegex        { fg = palette.green };    -- For regexes.
    -- TSStringEscape       { };    -- For escape characters within a string.
    -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
    -- TSType               { };    -- For types.
    -- TSTypeBuiltin        { };    -- For builtin types.
    -- TSVariable           { };    -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { };    -- Tags like html tag names.
    -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    TSEmphasis           { Bold };    -- For text to be represented with emphasis.
    TSUnderline          { Underlined };    -- For text to be represented with an underline.
    TSStrike             { gui="strikethrough" };    -- For strikethrough text.
    TSTitle              { Title };    -- Text that is part of a title.
    -- TSLiteral            { };    -- Literal text.
    TSURI                { Underlined };    -- Any URI  like a link or email.

    -- GitSigns
    GitSignsAdd          { fg = palette.green.lighten(10), bg = SignColumn.bg },
    GitSignsChange       { fg = palette.bright_orange.darken(10), bg = SignColumn.bg },
    GitSignsDelete       { fg = palette.magenta, bg = SignColumn.bg },

    -- scala
    scalaKeywordModifier        { Keyword },
    scalaKeywordSpecialFunction { Special, gui = "italic" },
    scalaAnnotation             { fg = palette.dark_orange },

    -- telescope
    TelescopeSelection      { bg = palette.light_grey.lighten(20) },
    TelescopeMultiSelection { Title },

    -- File explorer
    PanelHeading            { bg = hsl("#bdbdbd"), fg = palette.dark_grey, gui = "bold" },
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
