local hl = vim.api.nvim_set_hl

vim.g.colors_name = 'dracula'

-- reset colors
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

local settings = {
    bold = true,
    italic = true,
    inverse = true,
    undercurl = false,
    underline = false,
}

-- setting default values
for k, val in pairs(settings) do
    local key = 'dracula_' .. k
    if vim.g[key] == nil then
        vim.g[key] = val
    end
end

function get_color_from_var(color, default, colors)
    if color == nil then
        return default
    end

    local c = colors[color]
    if c == nil then
        print(string.format('%s color could not be found, using default', color))
        return default
    end
    return c
end

function merge(tbls)
    local source = {}
    for _, group in pairs(tbls) do
        for groupName, opts in pairs(group) do
            source[groupName] = opts
        end
    end

    return source
end

function add_highlights(hls)
    for group, settings in pairs(hls) do
        hl(0, group, settings)
    end
end

local colors = {
    none = 'NONE',
    fg = '#F8F8F2',
    bglighter = '#424450',
    bglight = '#343746',
    bg = '#282A36',
    bgdark = '#21222C',
    bgdarker = '#191A21',
    comment = '#6272A4',
    selection = '#44475A',
    subtle = '#424450',
    cyan = '#8BE9FD',
    green = '#50FA7B',
    orange = '#FFB86C',
    pink = '#FF79C6',
    purple = '#BD93F9',
    red = '#FF5555',
    yellow = '#F1FA8C',
}

vim.g.terminal_color_0 = '#21222C'
vim.g.terminal_color_1 = '#FF5555'
vim.g.terminal_color_2 = '#50FA7B'
vim.g.terminal_color_3 = '#F1FA8C'
vim.g.terminal_color_4 = '#BD93F9'
vim.g.terminal_color_5 = '#FF79C6'
vim.g.terminal_color_6 = '#8BE9FD'
vim.g.terminal_color_7 = '#F8F8F2'
vim.g.terminal_color_8 = '#6272A4'
vim.g.terminal_color_9 = '#FF6E6E'
vim.g.terminal_color_10 = '#69FF94'
vim.g.terminal_color_11 = '#FFFFA5'
vim.g.terminal_color_12 = '#D6ACFF'
vim.g.terminal_color_13 = '#FF92DF'
vim.g.terminal_color_14 = '#A4FFFF'
vim.g.terminal_color_15 = '#FFFFFF'

local base = {
    DraculaBgLight = { fg = colors.none, bg = colors.bglight },
    DraculaBgLighter = { fg = colors.none, bg = colors.bglighter },
    DraculaBgDark = { fg = colors.none, bg = colors.bgdark },
    DraculaBgDarker = { fg = colors.none, bg = colors.bgdarker },

    DraculaFg = { fg = colors.fg },
    DraculaFgUnderline = { fg = colors.fg, bg = colors.none, underline = vim.g.dracula_underline },
    DraculaFgBold = { fg = colors.fg, bg = colors.none, bold = vim.g.dracula_bold },

    DraculaComment = { fg = colors.comment },
    DraculaCommentBold = { fg = colors.comment, bg = colors.none, bold = vim.g.dracula_bold },

    DraculaSelection = { fg = colors.none, bg = colors.selection },

    DraculaSubtle = { fg = colors.subtle },

    DraculaCyan = { fg = colors.cyan },
    DraculaCyanItalic = { fg = colors.cyan, bg = colors.none, italic = vim.g.dracula_italic },

    DraculaGreen = { fg = colors.green },
    DraculaGreenBold = { fg = colors.green, bg = colors.none, bold = vim.g.dracula_bold },
    DraculaGreenItalic = { fg = colors.green, bg = colors.none, italic = vim.g.dracula_italic },
    DraculaGreenItalicUnderline = {
        fg = colors.green,
        bg = colors.none,
        italic = vim.g.dracula_italic,
        underline = vim.g.dracula_underline,
    },

    DraculaOrange = { fg = colors.orange },
    DraculaOrangeBold = { fg = colors.orange, bg = colors.none, bold = vim.g.dracula_bold },
    DraculaOrangeItalic = { fg = colors.orange, bg = colors.none, italic = vim.g.dracula_italic },
    DraculaOrangeBoldItalic = {
        fg = colors.orange,
        bg = colors.none,
        bold = vim.g.dracula_bold,
        italic = vim.g.dracula_italic,
    },
    DraculaOrangeInverse = { fg = colors.bg, bg = colors.orange },

    DraculaPink = { fg = colors.pink },
    DraculaPinkItali = { fg = colors.pink, bg = colors.none, italic = vim.g.dracula_italic },

    DraculaPurple = { fg = colors.purple },
    DraculaPurpleBold = { fg = colors.purple, bg = colors.none, bold = vim.g.dracula_bold },
    DraculaPurpleItalic = { fg = colors.purple, bg = colors.none, italic = vim.g.dracula_italic },

    DraculaRed = { fg = colors.red },
    DraculaRedInverse = { fg = colors.fg, bg = colors.red },

    DraculaYellow = { fg = colors.yellow },
    DraculaYellowItalic = { fg = colors.yellow, bg = colors.none, italic = vim.g.dracula_italic },

    DraculaError = { fg = colors.red, bg = colors.none, sp = colors.red },

    DraculaErrorLine = {
        fg = colors.none,
        bg = colors.none,
        undercurl = vim.g.dracula_undercurl,
        sp = colors.red,
    },
    DraculaWarnLine = {
        fg = colors.none,
        bg = colors.none,
        undercurl = vim.g.dracula_undercurl,
        sp = colors.orange,
    },
    DraculaInfoLine = {
        fg = colors.none,
        bg = colors.none,
        undercurl = vim.g.dracula_undercurl,
        sp = colors.cyan,
    },

    DraculaTodo = {
        fg = colors.cyan,
        bg = colors.none,
        bold = vim.g.dracula_bold,
        reverse = vim.g.dracula_inverse,
    },
    DraculaSearch = { fg = colors.green, bg = colors.none, reverse = vim.g.dracula_inverse },
    DraculaBoundary = { fg = colors.comment, bg = colors.bgdark },
    DraculaWinSeparator = { fg = colors.comment, bg = colors.bgdark },
    DraculaLink = { fg = colors.cyan, bg = colors.none, underline = vim.g.dracula_underline },

    DraculaDiffChange = { fg = colors.orange, bg = colors.none },
    DraculaDiffText = { fg = colors.bg, bg = colors.orange },
    DraculaDiffDelete = { fg = colors.red, bg = colors.bgdark },

    Normal = { fg = colors.fg, bg = colors.bg },

    StatusLine = { fg = colors.none, bg = colors.bglighter, bold = vim.g.dracula_bold },
    StatusLineNC = { fg = colors.none, bg = colors.bglight },
    StatusLineTerm = { fg = colors.none, bg = colors.bglighter, bold = vim.g.dracula_bold },
    StatusLineTermNC = { fg = colors.none, bg = colors.bglight },
    WildMenu = { fg = colors.bg, bg = colors.purple, bold = vim.g.dracula_bold },
    CursorLine = { fg = colors.none, bg = colors.subtle },

    LineNr = { fg = colors.comment },

    SignColumn = { fg = colors.comment },

    MatchParen = { fg = colors.green, bg = colors.none, underline = vim.g.dracula_underline },
    Conceal = { fg = colors.cyan, bg = colors.none },

    ColorColumn = { link = 'DraculaBgDark' },
    CursorColumn = { link = 'CursorLine' },
    CursorLineNr = { link = 'DraculaYellow' },
    DiffAdd = { link = 'DraculaGreen' },
    DiffAdded = { link = 'DiffAdd' },
    DiffChange = { link = 'DraculaDiffChange' },
    DiffDelete = { link = 'DraculaDiffDelete' },
    DiffRemoved = { link = 'DiffDelete' },
    DiffText = { link = 'DraculaDiffText' },
    Directory = { link = 'DraculaPurpleBold' },
    ErrorMsg = { link = 'DraculaRedInverse' },
    FoldColumn = { link = 'DraculaSubtle' },
    Folded = { link = 'DraculaBoundary' },
    IncSearch = { link = 'DraculaOrangeInverse' },

    MoreMsg = { link = 'DraculaFgBold' },
    NonText = { link = 'DraculaSubtle' },
    Pmenu = { link = 'DraculaBgDark' },
    PmenuSbar = { link = 'DraculaBgDark' },
    PmenuSel = { link = 'DraculaSelection' },
    PmenuThumb = { link = 'DraculaSelection' },
    Question = { link = 'DraculaFgBold' },
    Search = { link = 'DraculaSearch' },

    TabLine = { link = 'DraculaBoundary' },
    TabLineFill = { link = 'DraculaBgDark' },
    TabLineSel = { link = 'Normal' },
    Title = { link = 'DraculaGreenBold' },
    VertSplit = { link = 'DraculaWinSeparator' },
    Visual = { link = 'DraculaSelection' },
    VisualNOS = { link = 'Visual' },
    WarningMsg = { link = 'DraculaOrangeInverse' },

    SpecialKey = { link = 'DraculaRed' },
    LspReferenceText = { link = 'DraculaSelection' },
    LspReferenceRead = { link = 'DraculaSelection' },
    LspReferenceWrite = { link = 'DraculaSelection' },
    LspDiagnosticsDefaultInformation = { link = 'DiagnosticInfo' },
    LspDiagnosticsDefaultHint = { link = 'DiagnosticHint' },
    LspDiagnosticsDefaultError = { link = 'DiagnosticError' },
    LspDiagnosticsDefaultWarning = { link = 'DiagnosticWarn' },
    LspDiagnosticsUnderlineError = { link = 'DiagnosticUnderlineError' },
    LspDiagnosticsUnderlineHint = { link = 'DiagnosticUnderlineHint' },
    LspDiagnosticsUnderlineInformation = { link = 'DiagnosticUnderlineInfo' },
    LspDiagnosticsUnderlineWarning = { link = 'DiagnosticUnderlineWarn' },

    DiagnosticInfo = { link = 'DraculaCyan' },
    DiagnosticHint = { link = 'DraculaCyan' },
    DiagnosticError = { link = 'DraculaError' },
    DiagnosticWarn = { link = 'DraculaOrange' },
    DiagnosticUnderlineError = { link = 'DraculaErrorLine' },
    DiagnosticUnderlineHint = { link = 'DraculaInfoLine' },
    DiagnosticUnderlineInfo = { link = 'DraculaInfoLine' },
    DiagnosticUnderlineWarn = { link = 'DraculaWarnLine' },

    WinSeparator = { link = 'DraculaWinSeparator' },

    Comment = { link = 'DraculaComment' },
    Underlined = { link = 'DraculaFgUnderline' },
    Todo = { link = 'DraculaTodo' },

    Error = { link = 'DraculaError' },
    SpellBad = { link = 'DraculaErrorLine' },
    SpellLocal = { link = 'DraculaWarnLine' },
    SpellCap = { link = 'DraculaInfoLine' },
    SpellRare = { link = 'DraculaInfoLine' },

    Constant = { link = 'DraculaPurple' },
    String = { link = 'DraculaYellow' },
    Character = { link = 'DraculaPink' },
    Number = { link = 'Constant' },
    Boolean = { link = 'Constant' },
    Float = { link = 'Constant' },

    Identifier = { link = 'DraculaFg' },
    Function = { link = 'DraculaGreen' },

    Statement = { link = 'DraculaPink' },
    Conditional = { link = 'DraculaPink' },
    Repeat = { link = 'DraculaPink' },

    Label = { link = 'DraculaPink' },
    Operator = { link = 'DraculaPink' },
    Keyword = { link = 'DraculaPink' },
    Exception = { link = 'DraculaPink' },

    PreProc = { link = 'DraculaPink' },
    Include = { link = 'DraculaPink' },
    Define = { link = 'DraculaPink' },
    Macro = { link = 'DraculaPink' },
    PreCondit = { link = 'DraculaPink' },
    StorageClass = { link = 'DraculaPink' },
    Structure = { link = 'DraculaPink' },
    Typedef = { link = 'DraculaPink' },

    Type = { link = 'DraculaCyanItalic' },

    Delimiter = { link = 'DraculaFg' },

    Special = { link = 'DraculaPink' },
    SpecialComment = { link = 'DraculaCyanItalic' },
    Tag = { link = 'DraculaCyan' },
    helpHyperTextJump = { link = 'DraculaLink' },
    helpCommand = { link = 'DraculaPurple' },
    helpExample = { link = 'DraculaGreen' },
    helpBacktick = { link = 'Special' },
}

local plugins = {
    -- ALE
    ALEError = base.DraculaErrorLine,
    ALEWarning = base.DraculaWarnLine,
    ALEInfo = base.DraculaInfoLine,
    ALEErrorSign = base.DraculaRed,
    ALEWarningSign = base.DraculaOrange,
    ALEInfoSign = base.DraculaCyan,
    ALEVirtualTextError = base.Comment,
    ALEVirtualTextWarning = base.Comment,

    -- CtrlP
    CtrlPMatch = base.IncSearch,
    CtrlPBufferHid = base.Normal,

    -- GitGutter
    GitGutterAdd = base.DiffAdd,
    GitGutterChange = base.DiffChange,
    GitGutterDelete = base.DiffDelete,

    -- gitsigns
    GitSignsAdd = base.DiffAdd,
    GitSignsAddLn = base.DiffAdd,
    GitSignsAddNr = base.DiffAdd,
    GitSignsChange = base.DiffChange,
    GitSignsChangeLn = base.DiffChange,
    GitSignsChangeNr = base.DiffChange,
    GitSignsDelete = base.DiffDelete,
    GitSignsDeleteLn = base.DiffDelete,
    GitSignsDeleteNr = base.DiffDelete,

    -- Tree-sitter
    TSPunctSpecial = base.Special,
    TSConstMacro = base.Macro,
    TSStringEscape = base.Character,
    TSSymbol = base.DraculaPurple,
    TSAnnotation = base.DraculaYellow,
    TSAttribute = base.DraculaGreenItalic,
    TSFuncBuiltin = base.DraculaCyan,
    TSFuncMacro = base.Function,
    TSParameter = base.DraculaOrangeItalic,
    TSParameterReference = base.DraculaOrange,
    TSField = base.DraculaOrange,
    TSConstructor = base.DraculaCyan,
    TSLabel = base.DraculaPurpleItalic,
    TSVariableBuiltin = base.DraculaPurpleItalic,
    TSStrong = base.DraculaFgBold,
    TSEmphasis = base.DraculaFg,
    TSUnderline = base.Underlined,
    TSTitle = base.DraculaYellow,
    TSLiteral = base.DraculaYellow,
    TSURI = base.DraculaYellow,
    TSTagAttribute = base.DraculaGreenItalic,

    -- nvim-cmp
    CmpItemAbbrDeprecated = base.DraculaError,
    CmpItemAbbrMatch = base.DraculaCyan,
    CmpItemAbbrMatchFuzzy = base.DraculaCyan,
    CmpItemKindText = base.DraculaFg,
    CmpItemKindMethod = base.Function,
    CmpItemKindFunction = base.Function,
    CmpItemKindConstructor = base.DraculaCyan,
    CmpItemKindField = base.DraculaOrange,
    CmpItemKindVariable = base.DraculaPurpleItalic,
    CmpItemKindClass = base.DraculaCyan,
    CmpItemKindInterface = base.DraculaCyan,
    CmpItemKindModule = base.DraculaYellow,
    CmpItemKindProperty = base.DraculaPink,
    CmpItemKindUnit = base.DraculaFg,
    CmpItemKindValue = base.DraculaYellow,
    CmpItemKindEnum = base.DraculaPink,
    CmpItemKindKeyword = base.DraculaPink,
    CmpItemKindSnippet = base.DraculaFg,
    CmpItemKindColor = base.DraculaYellow,
    CmpItemKindFile = base.DraculaYellow,
    CmpItemKindReference = base.DraculaOrange,
    CmpItemKindFolder = base.DraculaYellow,
    CmpItemKindEnumMember = base.DraculaPurple,
    CmpItemKindConstant = base.DraculaPurple,
    CmpItemKindStruct = base.DraculaPink,
    CmpItemKindEvent = base.DraculaFg,
    CmpItemKindOperator = base.DraculaPink,
    CmpItemKindTypeParameter = base.DraculaCyan,
    CmpItemMenu = base.Comment,
}

local css = {
    cssAttrComma = base.Delimiter,
    cssAttrRegion = base.DraculaPink,
    cssAttributeSelector = base.DraculaGreenItalic,
    cssBraces = base.Delimiter,
    cssFunctionComma = base.Delimiter,
    cssNoise = base.DraculaPink,
    cssProp = base.DraculaCyan,
    cssPseudoClass = base.DraculaPink,
    cssPseudoClassId = base.DraculaGreenItalic,
    cssUnitDecorators = base.DraculaPink,
    cssVendor = base.DraculaGreenItalic,
}

local gitcommit = {
    diffFile = base.DraculaGreen,
    diffNewFile = base.DraculaRed,
    diffAdded = base.DraculaGreen,
    diffLine = base.DraculaCyanItalic,
    diffRemoved = base.DraculaRed,
}

local html = {
    htmlTag = base.DraculaFg,
    htmlArg = base.DraculaGreenItalic,
    htmlTitle = base.DraculaFg,
    htmlH1 = base.DraculaFg,
    htmlSpecialChar = base.DraculaPurple,
}

local javascript = {
    javaScriptBraces = base.Delimiter,
    javaScriptNumber = base.Constant,
    javaScriptNull = base.Constant,
    javaScriptFunction = base.Keyword,
}

local json = {
    jsonKeyword = base.DraculaCyan,
    jsonKeywordMatch = base.DraculaPink,
}

local lua = {
    luaFunc = base.DraculaCyan,
    luaTable = base.DraculaFg,

    luaBraces = base.DraculaFg,
    luaBuiltIn = base.Constant,
    luaDocTag = base.Keyword,
    luaErrHand = base.DraculaCyan,
    luaFuncArgName = base.DraculaOrangeItalic,
    luaFuncCall = base.Function,
    luaLocal = base.Keyword,
    luaSpecialTable = base.Constant,
    luaSpecialValue = base.DraculaCyan,
}

local markdown = {
    markdownBlockquote = base.DraculaCyan,
    markdownBold = base.DraculaOrangeBold,
    markdownBoldItalic = base.DraculaOrangeBoldItalic,
    markdownCodeBlock = base.DraculaGreen,
    markdownCode = base.DraculaGreen,
    markdownCodeDelimiter = base.DraculaGreen,
    markdownH1 = base.DraculaPurpleBold,
    markdownH2 = base.markdownH1,
    markdownH3 = base.markdownH1,
    markdownH4 = base.markdownH1,
    markdownH5 = base.markdownH1,
    markdownH6 = base.markdownH1,
    markdownHeadingDelimiter = base.markdownH1,
    markdownHeadingRule = base.markdownH1,
    markdownItalic = base.DraculaYellowItalic,
    markdownLinkText = base.DraculaPink,
    markdownListMarker = base.DraculaCyan,
    markdownOrderedListMarker = base.DraculaCyan,
    markdownRule = base.DraculaComment,
    markdownUrl = base.DraculaLink,
}

local perl = {
    perlMatchStartEnd = base.DraculaRed,
    perlOperator = base.DraculaCyan,
    perlStatementFiledesc = base.DraculaCyan,
    perlStatementFiles = base.DraculaCyan,
    perlStatementFlow = base.DraculaCyan,
    perlStatementHash = base.DraculaCyan,
    perlStatementIOfunc = base.DraculaCyan,
    perlStatementIPC = base.DraculaCyan,
    perlStatementList = base.DraculaCyan,
    perlStatementMisc = base.DraculaCyan,
    perlStatementNetwork = base.DraculaCyan,
    perlStatementNumeric = base.DraculaCyan,
    perlStatementProc = base.DraculaCyan,
    perlStatementPword = base.DraculaCyan,
    perlStatementRegexp = base.DraculaCyan,
    perlStatementScalar = base.DraculaCyan,
    perlStatementSocket = base.DraculaCyan,
    perlStatementTime = base.DraculaCyan,
    perlStatementVector = base.DraculaCyan,

    perlSignature = base.DraculaOrangeItalic,
    perlSubPrototype = base.DraculaOrangeItalic,
    perlVarSimpleMemberName = base.DraculaPurple,
}

local php = {
    phpClass = base.Type,
    phpClasses = base.Type,
    phpDocTags = base.DraculaCyanItalic,
    phpFunction = base.Function,
    phpParent = base.Normal,
    phpSpecialFunction = base.DraculaCyan,
}

local python = {
    pythonBuiltinObj = base.Type,
    pythonBuiltinObject = base.Type,
    pythonBuiltinType = base.Type,
    pythonClassVar = base.DraculaPurpleItalic,
    pythonExClass = base.Type,
    pythonNone = base.Type,
    pythonRun = base.Comment,
}

local ruby = {
    rubyBlockArgument = base.DraculaOrangeItalic,
    rubyBlockParameter = base.DraculaOrangeItalic,
    rubyCurlyBlock = base.DraculaPink,
    rubyGlobalVariable = base.DraculaPurple,
    rubyInstanceVariable = base.DraculaPurpleItalic,
    rubyInterpolationDelimiter = base.DraculaPink,
    rubyRegexpDelimiter = base.DraculaRed,
    rubyStringDelimiter = base.DraculaYellow,
}

local rust = {
    rustCommentLineDoc = base.Comment,
}

local sass = {
    sassClass = base.cssClassName,
    sassClassChar = base.cssClassNameDot,
    sassId = base.cssIdentifier,
    sassIdChar = base.cssIdentifier,
    sassInterpolationDelimiter = base.DraculaPink,
    sassMixinName = base.Function,
    sassProperty = base.cssProp,
    sassVariableAssignment = base.Operator,
}

local sh = {
    shCommandSub = base.NONE,
    shEscape = base.DraculaRed,
    shParen = base.NONE,
    shParenError = base.NONE,
}

local tex = {
    texBeginEndName = base.DraculaOrangeItalic,
    texBoldItalStyle = base.DraculaOrangeBoldItalic,
    texBoldStyle = base.DraculaOrangeBold,
    texInputFile = base.DraculaOrangeItalic,
    texItalStyle = base.DraculaYellowItalic,
    texLigature = base.DraculaPurple,
    texMath = base.DraculaPurple,
    texMathMatcher = base.DraculaPurple,
    texMathSymbol = base.DraculaPurple,
    texSpecialChar = base.DraculaPurple,
    texSubscripts = base.DraculaPurple,
    texTitle = base.DraculaFgBold,
}

local typescript = {
    typescriptAliasDeclaration = base.Type,
    typescriptArrayMethod = base.Function,
    typescriptArrowFunc = base.Operator,
    typescriptArrowFuncArg = base.DraculaOrangeItalic,
    typescriptAssign = base.Operator,
    typescriptBOMWindowProp = base.Constant,
    typescriptBinaryOp = base.Operator,
    typescriptBraces = base.Delimiter,
    typescriptCall = base.typescriptArrowFuncArg,
    typescriptClassHeritage = base.Type,
    typescriptClassName = base.Type,
    typescriptDateMethod = base.DraculaCyan,
    typescriptDateStaticMethod = base.Function,
    typescriptDecorator = base.DraculaGreenItalic,
    typescriptDefaultParam = base.Operator,
    typescriptES6SetMethod = base.DraculaCyan,
    typescriptEndColons = base.Delimiter,
    typescriptEnum = base.Type,
    typescriptEnumKeyword = base.Keyword,
    typescriptFuncComma = base.Delimiter,
    typescriptFuncKeyword = base.Keyword,
    typescriptFuncType = base.DraculaOrangeItalic,
    typescriptFuncTypeArrow = base.Operator,
    typescriptGlobal = base.Type,
    typescriptGlobalMethod = base.DraculaCyan,
    typescriptGlobalObjects = base.Type,
    typescriptIdentifier = base.DraculaPurpleItalic,
    typescriptInterfaceHeritage = base.Type,
    typescriptInterfaceName = base.Type,
    typescriptInterpolationDelimiter = base.Keyword,
    typescriptKeywordOp = base.Keyword,
    typescriptLogicSymbols = base.Operator,
    typescriptMember = base.Identifier,
    typescriptMemberOptionality = base.Special,
    typescriptObjectColon = base.Special,
    typescriptObjectLabel = base.Identifier,
    typescriptObjectSpread = base.Operator,
    typescriptOperator = base.Operator,
    typescriptParamImpl = base.DraculaOrangeItalic,
    typescriptParens = base.Delimiter,
    typescriptPredefinedType = base.Type,
    typescriptRestOrSpread = base.Operator,
    typescriptTernaryOp = base.Operator,
    typescriptTypeAnnotation = base.Special,
    typescriptTypeCast = base.Operator,
    typescriptTypeParameter = base.DraculaOrangeItalic,
    typescriptTypeReference = base.Type,
    typescriptUnaryOp = base.Operator,
    typescriptVariable = base.Keyword,
}

local typescriptreact = {
    tsxAttrib = base.DraculaGreenItalic,
    tsxEqual = base.Operator,
    tsxIntrinsicTagName = base.Keyword,
    tsxTagName = base.Type,
}

local vim = {
    vimAutoCmdSfxList = base.Type,
    vimAutoEventList = base.Type,
    vimEnvVar = base.Constant,
    vimFunction = base.Function,
    vimHiBang = base.Keyword,
    vimOption = base.Type,
    vimSetMod = base.Keyword,
    vimSetSep = base.Delimiter,
    vimUserAttrbCmpltFunc = base.Function,
    vimUserFunc = base.Function,
}

local xml = {
    xmlAttrib = base.DraculaGreenItalic,
    xmlEqual = base.Operator,
    xmlTag = base.Delimiter,
    xmlTagName = base.Statement,
}

local yaml = {
    yamlAlias = base.DraculaGreenItalicUnderline,
    yamlAnchor = base.DraculaPinkItalic,
    yamlBlockMappingKey = base.DraculaCyan,
    yamlFlowCollection = base.DraculaPink,
    yamlFlowIndicator = base.Delimiter,
    yamlNodeTag = base.DraculaPink,
    yamlPlainScalar = base.DraculaYellow,
}

local langs = merge({
    cas,
    gitcommit,
    html,
    javascript,
    json,
    lua,
    markdown,
    perl,
    php,
    python,
    ruby,
    rust,
    sass,
    sh,
    tex,
    typescript,
    typescriptreact,
    vim,
    xml,
    yaml,
})

local specs = { base, langs, plugins }
local spec = merge(specs)

add_highlights(spec)
