local hl = vim.api.nvim_set_hl

vim.g.colors_name = 'gruvbox'

-- reset colors
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

-- gruvbox settings handler
local settings = {
    contrast_dark = 'medium',
    contrast_light = 'medium',
    bold = true,
    italic = true,
    undercurl = true,
    underline = true,
    inverse = true,
    improved_strings = false,
    improved_warnings = false,
    invert_signs = false,
    invert_selection = false,
    invert_tabline = false,
    italicize_comments = true,
    italicize_strings = false,
    invert_intend_guides = false,
}

-- setting default values
for k, val in pairs(settings) do
    local key = 'gruvbox_' .. k
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
    dark0_hard = '#1d2021',
    dark0 = '#282828',
    dark0_soft = '#32302f',
    dark1 = '#3c3836',
    dark2 = '#504945',
    dark3 = '#665c54',
    dark4 = '#7c6f64',
    light0_hard = '#f9f5d7',
    light0 = '#fbf1c7',
    light0_soft = '#f2e5bc',
    light1 = '#ebdbb2',
    light2 = '#d5c4a1',
    light3 = '#bdae93',
    light4 = '#a89984',
    bright_red = '#fb4934',
    bright_green = '#b8bb26',
    bright_yellow = '#fabd2f',
    bright_blue = '#83a598',
    bright_purple = '#d3869b',
    bright_aqua = '#8ec07c',
    bright_orange = '#fe8019',
    neutral_red = '#cc241d',
    neutral_green = '#98971a',
    neutral_yellow = '#d79921',
    neutral_blue = '#458588',
    neutral_purple = '#b16286',
    neutral_aqua = '#689d6a',
    neutral_orange = '#d65d0e',
    faded_red = '#9d0006',
    faded_green = '#79740e',
    faded_yellow = '#b57614',
    faded_blue = '#076678',
    faded_purple = '#8f3f71',
    faded_aqua = '#427b58',
    faded_orange = '#af3a03',
    gray = '#928374',
}

-- options (dark mode by default)
local bg0 = colors.dark0
local bg1 = colors.dark1
local bg2 = colors.dark2
local bg3 = colors.dark3
local bg4 = colors.dark4

local fg0 = colors.light0
local fg1 = colors.light1
local fg2 = colors.light2
local fg3 = colors.light3
local fg4 = colors.light4

local red = colors.bright_red
local green = colors.bright_green
local yellow = colors.bright_yellow
local blue = colors.bright_blue
local purple = colors.bright_purple
local aqua = colors.bright_aqua
local orange = colors.bright_orange
local gray = colors.gray

local bg = vim.opt.background:get()

if bg == nil then
    bg = 'dark'
    vim.o.background = bg
end

-- swap colors if light mode
if bg == 'light' then
    bg0 = colors.light0
    bg1 = colors.light1
    bg2 = colors.light2
    bg3 = colors.light3
    bg4 = colors.light4
    fg0 = colors.dark0
    fg1 = colors.dark1
    fg2 = colors.dark2
    fg3 = colors.dark3
    fg4 = colors.dark4
    red = colors.faded_red
    green = colors.faded_green
    yellow = colors.faded_yellow
    blue = colors.faded_blue
    purple = colors.faded_purple
    aqua = colors.faded_aqua
    orange = colors.faded_orange
end

-- handle light/dark contrast settings
local contrast = vim.g['gruvbox_contrast_' .. bg]
if contrast == 'hard' then
    bg0 = colors[bg .. '0_hard']
elseif contrast == 'soft' then
    bg0 = colors[bg .. '0_soft']
end

-- extending colors table with basic names for easy customization in g:gruvbox_* options
colors.bg0 = bg0
colors.bg1 = bg1
colors.bg2 = bg2
colors.bg3 = bg3
colors.bg4 = bg4
colors.fg0 = fg0
colors.fg1 = fg1
colors.fg2 = fg2
colors.fg3 = fg3
colors.fg4 = fg4
colors.red = red
colors.green = green
colors.yellow = yellow
colors.blue = blue
colors.purple = purple
colors.aqua = aqua
colors.orange = orange

local hls_cursor = get_color_from_var(vim.g.gruvbox_hls_cursor, orange, colors)
local hls_highlight = get_color_from_var(vim.g.gruvbox_hls_highlight, yellow, colors)
local number_column = get_color_from_var(vim.g.gruvbox_number_column, nil, colors)
local color_column = get_color_from_var(vim.g.gruvbox_color_column, bg1, colors)
local vert_split = get_color_from_var(vim.g.gruvbox_vert_split, bg0, colors)
local tabline_sel = get_color_from_var(vim.g.gruvbox_tabline_sel, green, colors)
local sign_column = get_color_from_var(vim.g.gruvbox_sign_column, bg1, colors)
local cursor_line = get_color_from_var(vim.g.gruvbox_cursor_line, bg1, colors)

local improved_strings_fg = fg1
local improved_strings_bg = bg1

local special_string_fg = orange
local special_string_bg = bg1

if not vim.g.gruvbox_improved_strings then
    improved_strings_fg = green
    improved_strings_bg = nil
    special_string_bg = nil
end

-- neovim terminal mode colors
vim.g.terminal_color_0 = bg0
vim.g.terminal_color_8 = gray
vim.g.terminal_color_1 = colors.neutral_red
vim.g.terminal_color_9 = red
vim.g.terminal_color_2 = colors.neutral_green
vim.g.terminal_color_10 = green
vim.g.terminal_color_3 = colors.neutral_yellow
vim.g.terminal_color_11 = yellow
vim.g.terminal_color_4 = colors.neutral_blue
vim.g.terminal_color_12 = blue
vim.g.terminal_color_5 = colors.neutral_purple
vim.g.terminal_color_13 = purple
vim.g.terminal_color_6 = colors.neutral_aqua
vim.g.terminal_color_14 = aqua
vim.g.terminal_color_7 = fg4
vim.g.terminal_color_15 = fg1

local base = {
    -- Base groups
    GruvboxFg0 = { fg = fg0 },
    GruvboxFg1 = { fg = fg1 },
    GruvboxFg2 = { fg = fg2 },
    GruvboxFg3 = { fg = fg3 },
    GruvboxFg4 = { fg = fg4 },
    GruvboxGray = { fg = gray },
    GruvboxBg0 = { fg = bg0 },
    GruvboxBg1 = { fg = bg1 },
    GruvboxBg2 = { fg = bg2 },
    GruvboxBg3 = { fg = bg3 },
    GruvboxBg4 = { fg = bg4 },

    GruvboxRed = { fg = red },
    GruvboxRedBold = { fg = red, bold = vim.g.gruvbox_bold },
    GruvboxGreen = { fg = green },
    GruvboxGreenBold = { fg = green, bold = vim.g.gruvbox_bold },
    GruvboxYellow = { fg = yellow },
    GruvboxYellowBold = { fg = yellow, bold = vim.g.gruvbox_bold },
    GruvboxBlue = { fg = blue },
    GruvboxBlueBold = { fg = blue, bold = vim.g.gruvbox_bold },
    GruvboxPurple = { fg = purple },
    GruvboxPurpleBold = { fg = purple, bold = vim.g.gruvbox_bold },
    GruvboxAqua = { fg = aqua },
    GruvboxAquaBold = { fg = aqua, bold = vim.g.gruvbox_bold },
    GruvboxOrange = { fg = orange },
    GruvboxOrangeBold = { fg = orange, bold = vim.g.gruvbox_bold },

    GruvboxRedSign = { fg = red, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
    GruvboxGreenSign = { fg = green, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
    GruvboxYellowSign = { fg = yellow, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
    GruvboxBlueSign = { fg = blue, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
    GruvboxPurpleSign = { fg = purple, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
    GruvboxAquaSign = { fg = aqua, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
    GruvboxOrangeSign = { fg = orange, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },

    GruvboxRedUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = red },
    GruvboxGreenUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = green },
    GruvboxYellowUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = yellow },
    GruvboxBlueUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = blue },
    GruvboxPurpleUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = purple },
    GruvboxAquaUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = aqua },
    GruvboxOrangeUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = orange },

    ColorColumn = { bg = color_column },
    Conceal = { fg = blue },
    Cursor = { reverse = vim.g.gruvbox_inverse },
    lCursor = { link = 'Cursor' },
    iCursor = { link = 'Cursor' },
    vCursor = { link = 'Cursor' },
    CursorIM = { link = 'Cursor' },
    CursorLine = { bg = cursor_line },
    CursorColumn = { link = 'CursorLine' },
    Directory = { link = 'GruvboxGreenBold' },
    DiffAdd = { fg = green, bg = bg0, reverse = vim.g.gruvbox_inverse },
    DiffChange = { fg = aqua, bg = bg0, reverse = vim.g.gruvbox_inverse },
    DiffDelete = { fg = red, bg = bg0, reverse = vim.g.gruvbox_inverse },
    DiffText = { fg = yellow, bg = bg0, reverse = vim.g.gruvbox_inverse },
    ErrorMsg = { fg = bg0, bg = red, bold = vim.g.gruvbox_bold },
    VertSplit = { fg = bg3, bg = vert_split },
    Folded = { fg = gray, bg = bg1, italic = vim.g.gruvbox_italic },
    FoldColumn = { fg = gray, bg = bg1 },
    SignColumn = { bg = sign_column },
    IncSearch = { fg = hls_cursor, bg = bg0, reverse = vim.g.gruvbox_inverse },
    LineNr = { fg = bg4, bg = number_column },
    CursorLineNr = { fg = yellow, bg = bg1 },
    MatchParen = { bg = bg3, bold = vim.g.gruvbox_bold },
    ModeMsg = { link = 'GruvboxYellowBold' },
    MoreMsg = { link = 'GruvboxYellowBold' },
    NonText = { link = 'GruvboxBg2' },
    Normal = { fg = fg1, bg = bg0 },
    Pmenu = { fg = fg1, bg = bg2 },
    PmenuSel = { fg = bg2, bg = blue, bold = vim.g.gruvbox_bold },
    PmenuSbar = { bg = bg2 },
    PmenuThumb = { bg = bg4 },
    Question = { link = 'GruvboxOrangeBold' },
    QuickFixLine = { bg = bg0, bold = vim.g.gruvbox_bold },
    Search = { fg = hls_highlight, bg = bg0, reverse = vim.g.gruvbox_inverse },
    CurSearch = { link = 'IncSearch' },
    SpecialKey = { link = 'GruvboxFg4' },
    SpellRare = { link = 'GruvboxPurpleUnderline' },
    SpellBad = { link = 'GruvboxRedUnderline' },
    SpellLocal = { link = 'GruvboxAquaUnderline' },
    SpellCap = vim.g.gruvbox_improved_warnings and {
        fg = green,
        bold = vim.g.gruvbox_bold,
        italic = vim.g.gruvbox_italic,
    } or { link = 'GruvboxBlueUnderline' },
    StatusLine = { fg = bg2, bg = fg1, bold = vim.g.gruvbox_bold, reverse = vim.g.gruvbox_inverse },
    StatusLineNC = { fg = bg1, bg = fg4, reverse = vim.g.gruvbox_inverse },
    TabLineFill = { fg = bg4, bg = bg1, reverse = vim.g.gruvbox_invert_tabline },
    TabLine = { link = 'TabLineFill' },
    TabLineSel = { fg = tabline_sel, bg = bg1, reverse = vim.g.gruvbox_invert_tabline },
    Title = { link = 'GruvboxGreenBold' },
    Visual = { bg = bg3, reverse = vim.g.gruvbox_invert_selection },
    VisualNOS = { link = 'Visual' },
    WarningMsg = { link = 'GruvboxRedBold' },
    WildMenu = { fg = blue, bg = bg2, bold = vim.g.gruvbox_bold },
    Constant = { link = 'GruvboxPurple' },
    Special = {
        fg = special_string_fg,
        bg = special_string_bg,
        italic = vim.g.gruvbox_improved_strings,
    },
    String = {
        fg = improved_strings_fg,
        bg = improved_strings_bg,
        italic = vim.g.gruvbox_italicize_strings,
    },
    Character = { link = 'GruvboxPurple' },
    Number = { link = 'GruvboxPurple' },
    Boolean = { link = 'GruvboxPurple' },
    Float = { link = 'GruvboxPurple' },
    Identifier = { link = 'GruvboxBlue' },
    Function = { link = 'GruvboxGreenBold' },
    Statement = { link = 'GruvboxRed' },
    Conditional = { link = 'GruvboxRed' },
    Repeat = { link = 'GruvboxRed' },
    Label = { link = 'GruvboxRed' },
    Exception = { link = 'GruvboxRed' },
    Keyword = { link = 'GruvboxRed' },
    Operator = { link = 'GruvboxFg1' },
    PreProc = { link = 'GruvboxAqua' },
    Include = { link = 'GruvboxAqua' },
    Define = { link = 'GruvboxAqua' },
    Macro = { link = 'GruvboxAqua' },
    PreCondit = { link = 'GruvboxAqua' },
    Type = { link = 'GruvboxYellow' },
    StorageClass = { link = 'GruvboxOrange' },
    Structure = { link = 'GruvboxAqua' },
    Typedef = { link = 'GruvboxYellow' },
    SpecialChar = { link = 'GruvboxRed' },
    Tag = { link = 'GruvboxAquaBold' },
    Delimiter = { link = 'GruvboxFg3' },
    Comment = { fg = gray, italic = vim.g.gruvbox_italicize_comments },
    Debug = { link = 'GruvboxRed' },
    Underlined = { fg = blue, underline = vim.g.gruvbox_underline },
    Bold = { bold = vim.g.gruvbox_bold },
    Italic = { italic = vim.g.gruvbox_italic },
    Ignore = {},
    Error = { fg = red, bold = vim.g.gruvbox_bold, reverse = vim.g.gruvbox_inverse },
    Todo = { fg = fg0, bold = vim.g.gruvbox_bold, italic = vim.g.gruvbox_italic },
    diffAdded = { link = 'GruvboxGreen' },
    diffRemoved = { link = 'GruvboxRed' },
    diffChanged = { link = 'GruvboxAqua' },
    diffFile = { link = 'GruvboxOrange' },
    diffNewFile = { link = 'GruvboxYellow' },
    diffLine = { link = 'GruvboxBlue' },
    -- signature
    SignatureMarkText = { link = 'GruvboxBlueSign' },
    SignatureMarkerText = { link = 'GruvboxPurpleSign' },
    -- gitcommit
    gitcommitSelectedFile = { link = 'GruvboxGreen' },
    gitcommitDiscardedFile = { link = 'GruvboxRed' },
    -- checkhealth
    healthError = { fg = bg0, bg = red },
    healthSuccess = { fg = bg0, bg = green },
    healthWarning = { fg = bg0, bg = yellow },
}

local plugins = {
    -- netrw
    netrwDir = base.GruvboxAqua,
    netrwClassify = base.GruvboxAqua,
    netrwLink = base.GruvboxGray,
    netrwSymLink = base.GruvboxFg1,
    netrwExe = base.GruvboxYellow,
    netrwComment = base.GruvboxGray,
    netrwList = base.GruvboxBlue,
    netrwHelpCmd = base.GruvboxAqua,
    netrwCmdSep = base.GruvboxFg3,
    netrwVersion = base.GruvboxGreen,
    -- nvim-treesitter
    TSNone = {},
    TSError = {},
    TSTitle = base.Title,
    TSLiteral = base.String,
    TSURI = base.Underlined,
    TSVariable = base.GruvboxFg1,
    TSPunctDelimiter = base.Delimiter,
    TSPunctBracket = base.Delimiter,
    TSPunctSpecial = base.Delimiter,
    TSConstant = base.Constant,
    TSConstBuiltin = base.Special,
    TSConstMacro = base.Define,
    TSString = base.String,
    TSStringRegex = base.String,
    TSStringEscape = base.SpecialChar,
    TSCharacter = base.Character,
    TSNumber = base.Number,
    TSBoolean = base.Boolean,
    TSFloat = base.Float,
    TSFunction = base.Function,
    TSFuncBuiltin = base.Special,
    TSFuncMacro = base.Macro,
    TSParameter = base.Identifier,
    TSParameterReference = { link = 'TSParameter' },
    TSMethod = base.Function,
    TSField = base.Identifier,
    TSProperty = base.Identifier,
    TSConstructor = base.Special,
    TSAnnotation = base.PreProc,
    TSAttribute = base.PreProc,
    TSNamespace = base.Include,
    TSConditional = base.Conditional,
    TSRepeat = base.Repeat,
    TSLabel = base.Label,
    TSOperator = base.Operator,
    TSKeyword = base.Keyword,
    TSKeywordFunction = base.Keyword,
    TSKeywordOperator = base.GruvboxRed,
    TSException = base.Exception,
    TSType = base.Type,
    TSTypeBuiltin = base.Type,
    TSInclude = base.Include,
    TSVariableBuiltin = base.Special,
    TSText = { link = 'TSNone' },
    TSStrong = { bold = vim.g.gruvbox_bold },
    TSEmphasis = { italic = vim.g.gruvbox_italicize_strings },
    TSUnderline = { underline = vim.g.gruvbox_underline },
    TSComment = base.Comment,
    TSStructure = base.GruvboxOrange,
    TSTag = base.GruvboxOrange,
    TSTagDelimiter = base.GruvboxGreen,

    -- telescope.nvim
    TelescopeSelection = base.GruvboxOrangeBold,
    TelescopeSlectionCaret = base.GruvboxRed,
    TelescopeMultiSelection = base.GruvboxGray,
    TelescopeNormal = base.GruvboxFg1,
    TelescopeBorder = { link = 'TelescopeNormal' },
    TelescopePromptBorder = { link = 'TelescopeNormal' },
    TelescopeResultsBorder = { link = 'TelescopeNormal' },
    TelescopePreviewBorder = { link = 'TelescopeNormal' },
    TelescopeMatching = base.GruvboxBlue,
    TelescopePromptPrefix = base.GruvboxRed,
    TelescopePrompt = { link = 'TelescopeNormal' },
    -- lspsaga.nvim
    LspSagaDiagnosticBorder = base.NormalNC,
    LspSagaDiagnosticHeader = base.GruvboxRed,
    LspSagaDiagnosticTruncateLine = base.NormalNC,
    LspFloatWinBorder = base.NormalNC,
    LspSagaBorderTitle = base.Title,
    TargetWord = base.Error,
    ReferencesCount = base.Title,
    ReferencesIcon = base.Special,
    DefinitionCount = base.Title,
    TargetFileName = base.Comment,
    DefinitionIcon = base.Special,
    ProviderTruncateLine = base.NormalNC,
    SagaShadow = base.GruvboxBg0,
    LspSagaFinderSelection = base.Search,
    DiagnosticTruncateLine = base.NormalNC,
    DiagnosticWarning = base.DiagnosticWarn,
    DiagnosticInformation = base.DiagnosticInfo,
    DefinitionPreviewTitle = base.Title,
    LspSagaShTruncateLine = base.NormalNC,
    LspSagaDocTruncateLine = base.NormalNC,
    LineDiagTuncateLine = base.NormalNC,
    LspSagaCodeActionTitle = base.Title,
    LspSagaCodeActionTruncateLine = base.NormalNC,
    LspSagaCodeActionContent = base.Normal,
    LspSagaRenamePromptPrefix = base.GruvboxFg2,
    LspSagaRenameBorder = { bold = vim.g.gruvbox_bold },
    LspSagaHoverBorder = { bold = vim.g.gruvbox_bold },
    LspSagaSignatureHelpBorder = { bold = vim.g.gruvbox_bold },
    LspSagaCodeActionBorder = { bold = vim.g.gruvbox_bold },
    LspSagaAutoPreview = {},
    LspSagaDefPreviewBorder = { bold = vim.g.gruvbox_bold },
    LspLinesDiagBorder = { bold = vim.g.gruvbox_bold },
    -- vim-startify
    StartifyBracket = base.GruvboxFg3,
    StartifyFile = base.GruvboxFg1,
    StartifyNumber = base.GruvboxBlue,
    StartifyPath = base.GruvboxGray,
    StartifySlash = base.GruvboxGray,
    StartifySection = base.GruvboxYellow,
    StartifySpecial = base.GruvboxBg2,
    StartifyHeader = base.GruvboxOrange,
    StartifyFooter = base.GruvboxBg2,
    StartifyVar = { link = 'StartifyPath' },
    StartifySelect = base.Title,
    -- vim-signify
    SignifySignAdd = base.GruvboxGreenSign,
    SignifySignChange = base.GruvboxAquaSign,
    SignifySignDelete = base.GruvboxRedSign,
    -- syntastic
    SyntasticError = base.GruvboxRedUnderline,
    SyntasticWarning = base.GruvboxYellowUnderline,
    SyntasticErrorSign = base.GruvboxRedSign,
    SyntasticWarningSign = base.GruvboxYellowSign,
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = base.GruvboxRedSign,
    -- vim-dirvish
    DirvishPathTail = base.GruvboxAqua,
    DirvishArg = base.GruvboxYellow,
    -- nerdtree
    NERDTreeDir = base.GruvboxAqua,
    NERDTreeDirSlash = base.GruvboxAqua,
    NERDTreeOpenable = base.GruvboxOrange,
    NERDTreeClosable = base.GruvboxOrange,
    NERDTreeFile = base.GruvboxFg1,
    NERDTreeExecFile = base.GruvboxYellow,
    NERDTreeUp = base.GruvboxGray,
    NERDTreeCWD = base.GruvboxGreen,
    NERDTreeHelp = base.GruvboxFg1,
    NERDTreeToggleOn = base.GruvboxGreen,
    NERDTreeToggleOff = base.GruvboxRed,
    -- coc.nvim
    CocErrorSign = base.GruvboxRedSign,
    CocWarningSign = base.GruvboxOrangeSign,
    CocInfoSign = base.GruvboxBlueSign,
    CocHintSign = base.GruvboxAquaSign,
    CocErrorFloat = base.GruvboxRed,
    CocWarningFloat = base.GruvboxOrange,
    CocInfoFloat = base.GruvboxBlue,
    CocHintFloat = base.GruvboxAqua,
    CocDiagnosticsError = base.GruvboxRed,
    CocDiagnosticsWarning = base.GruvboxOrange,
    CocDiagnosticsInfo = base.GruvboxBlue,
    CocDiagnosticsHint = base.GruvboxAqua,
    CocSelectedText = base.GruvboxRed,
    CocCodeLens = base.GruvboxGray,
    CocErrorHighlight = base.GruvboxRedUnderline,
    CocWarningHighlight = base.GruvboxOrangeUnderline,
    CocInfoHighlight = base.GruvboxBlueUnderline,
    CocHintHighlight = base.GruvboxAquaUnderline,
    -- ale.vim
    ALEError = base.GruvboxRedUnderline,
    ALEWarning = base.GruvboxYellowUnderline,
    ALEInfo = base.GruvboxBlueUnderline,
    ALEErrorSign = base.GruvboxRedSign,
    ALEWarningSign = base.GruvboxYellowSign,
    ALEInfoSign = base.GruvboxBlueSign,
    ALEVirtualTextError = base.GruvboxRed,
    ALEVirtualTextWarning = base.GruvboxYellow,
    ALEVirtualTextInfo = base.GruvboxBlue,
    -- vim-buftabline
    BufTabLineCurrent = base.TabLineSel,
    BufTabLineActive = base.PmenuSel,
    BufTabLineHidden = base.TabLine,
    BufTabLineFill = base.TabLineFill,
    BufTabLineModifiedCurrent = { link = 'BufTabLineCurrent' },
    BufTabLineModifiedActive = { link = 'BufTabLineActive' },
    BufTabLineModifiedHidden = { link = 'BufTabLineHidden' },
    -- ctrlP
    CtrlPMatch = base.Identifier,
    CtrlPNoEntries = base.Error,
    CtrlPPrtBase = base.Comment,
    CtrlPPrtCursor = base.Constant,
    CtrlPLinePre = { fg = base.GruvboxBg2.fg },
    CtrlPMode1 = base.Character,
    CtrlPMode2 = base.LineNr,
    CtrlPStats = base.Function,
    -- fzf.vim
    Fzf1 = { fg = base.GruvboxBlue.fg, bg = base.GruvboxBg1.fg },
    Fzf2 = { fg = base.GruvboxOrange.fg, bg = base.GruvboxBg1.fg },
    Fzf3 = { fg = base.GruvboxFg4.fg, bg = base.GruvboxBg1.fg },
    ShowMarksHLl = base.GruvboxBlueSign,
    ShowMarksHLu = base.GruvboxBlueSign,
    ShowMarksHLo = base.GruvboxBlueSign,
    ShowMarksHLm = base.GruvboxBlueSign,
    -- git-gutter
    GitGutterAdd = base.GruvboxGreenSign,
    GitGutterChange = base.GruvboxAquaSign,
    GitGutterDelete = base.GruvboxRedSign,
    GitGutterChangeDelete = base.GruvboxAquaSign,
    -- gitsigns.nvim
    GitSignsAdd = base.GruvboxGreenSign,
    GitSignsChange = base.GruvboxOrangeSign,
    GitSignsDelete = base.GruvboxRedSign,
    GitSignsCurrentLineBlame = base.NonText,
    -- nvim-cmp
    CmpItemAbbr = base.GruvboxFg0,
    CmpItemAbbrDeprecated = base.GruvboxFg0,
    CmpItemAbbrMatch = base.GruvboxBlue,
    CmpItemAbbrMatchFuzzy = { underline = vim.g.gruvbox_underline, fg = base.GruvboxAqua.fg },
    CmpItemKind = base.GruvboxOrange,
    CmpItemKindClass = base.GruvboxGreen,
    CmpItemKindConstructor = base.GruvboxGreen,
    CmpItemKindField = base.GruvboxAqua,
    CmpItemKindFile = base.GruvboxOrange,
    CmpItemKindFolder = base.GruvboxOrange,
    CmpItemKindFunction = base.GruvboxPurple,
    CmpItemKindInterface = base.GruvboxGreen,
    CmpItemKindKeyword = base.Keyword,
    CmpItemKindMethod = base.GruvboxPurple,
    CmpItemKindSnippet = base.GruvboxYellow,
    CmpItemKindText = base.GruvboxFg0,
    CmpItemKindValue = base.GruvboxOrange,
    CmpItemKindVariable = base.GruvboxBlue,
    CmpItemMenu = base.GruvboxGray,
    -- LSP
    LspCodeLens = base.GruvboxGray,
    LspReferenceRead = { bg = base.GruvboxBg2.fg, underline = vim.g.gruvbox_underline },
    LspReferenceText = { bg = base.GruvboxBg2.fg, underline = vim.g.gruvbox_underline },
    LspReferenceWrite = { bg = base.GruvboxBg2.fg, underline = vim.g.gruvbox_underline },
    -- Diagnostic
    DiagnosticError = base.GruvboxRed,
    DiagnosticSignError = base.GruvboxRedSign,
    DiagnosticUnderlineError = base.GruvboxRedUnderline,
    DiagnosticWarn = base.GruvboxYellow,
    DiagnosticSignWarn = base.GruvboxYellowSign,
    DiagnosticUnderlineWarn = base.GruvboxYellowUnderline,
    DiagnosticInfo = base.GruvboxBlue,
    DiagnosticSignInfo = base.GruvboxBlueSign,
    DiagnosticUnderlineInfo = base.GruvboxBlueUnderline,
    DiagnosticHint = base.GruvboxAqua,
    DiagnosticSignHint = base.GruvboxAquaSign,
    DiagnosticUnderlineHint = base.GruvboxAquaUnderline,
    DiagnosticFloatingError = base.GruvboxRed,
    DiagnosticFloatingWarn = base.GruvboxOrange,
    DiagnosticFloatingInfo = base.GruvboxBlue,
    DiagnosticFloatingHint = base.GruvboxAqua,
    DiagnosticVirtualTextError = base.GruvboxRed,
    DiagnosticVirtualTextWarn = base.GruvboxYellow,
    DiagnosticVirtualTextInfo = base.GruvboxBlue,
    DiagnosticVirtualTextHint = base.GruvboxAqua,
    -- mail.vim
    mailQuoted1 = base.GruvboxAqua,
    mailQuoted2 = base.GruvboxPurple,
    mailQuoted3 = base.GruvboxYellow,
    mailQuoted4 = base.GruvboxGreen,
    mailQuoted5 = base.GruvboxRed,
    mailQuoted6 = base.GruvboxOrange,
    mailSignature = base.Comment,
}

-- xml
local xml = {
    xmlTag = base.GruvboxAquaBold,
    xmlEndTag = base.GruvboxAquaBold,
    xmlTagName = base.GruvboxBlue,
    xmlEqual = base.GruvboxBlue,
    docbkKeyword = base.GruvboxAquaBold,
    xmlDocTypeDecl = base.GruvboxGray,
    xmlDocTypeKeyword = base.GruvboxPurple,
    xmlCdataStart = base.GruvboxGray,
    xmlCdataCdata = base.GruvboxPurple,
    dtdFunction = base.GruvboxGray,
    dtdTagName = base.GruvboxPurple,
    xmlAttrib = base.GruvboxOrange,
    xmlProcessingDelim = base.GruvboxGray,
    dtdParamEntityPunct = base.GruvboxGray,
    dtdParamEntityDPunct = base.GruvboxGray,
    xmlAttribPunct = base.GruvboxGray,
    xmlEntity = base.GruvboxRed,
    xmlEntityPunct = base.GruvboxRed,
}

local purescript = {
    purescriptModuleKeyword = base.GruvboxAqua,
    purescriptModuleName = base.GruvboxFg1,
    purescriptWhere = base.GruvboxAqua,
    purescriptDelimiter = base.GruvboxFg4,
    purescriptType = base.GruvboxFg1,
    purescriptImportKeyword = base.GruvboxAqua,
    purescriptHidingKeyword = base.GruvboxAqua,
    purescriptAsKeyword = base.GruvboxAqua,
    purescriptStructure = base.GruvboxAqua,
    purescriptOperator = base.GruvboxBlue,
    purescriptTypeVar = base.GruvboxFg1,
    purescriptConstructor = base.GruvboxFg1,
    purescriptFunction = base.GruvboxFg1,
    purescriptConditional = base.GruvboxOrange,
    purescriptBacktick = base.GruvboxOrange,
}

local coffeescript = {
    coffeeParen = base.GruvboxFg3,
    coffeeCurly = base.GruvboxOrange,
    coffeeSpecialOp = base.GruvboxFg3,
    coffeeExtendedOp = base.GruvboxFg3,
    coffeeBracket = base.GruvboxOrange,
}

local objc = {
    objcDirective = base.GruvboxBlue,
    objcTypeModifier = base.GruvboxRed,
}

local moonscript = {
    moonObject = base.GruvboxYellow,
    moonFunction = base.GruvboxFg3,
    moonSpecialOp = base.GruvboxFg3,
    moonExtendedOp = base.GruvboxFg3,
}

local elixir = {
    elixirDocString = base.Comment,
    elixirStringDelimiter = base.GruvboxGreen,
    elixirModuleDeclaration = base.GruvboxYellow,
    elixirInterpolationDelimiter = base.GruvboxAqua,
}

local markdown = {
    markdownItalic = { fg = base.GruvboxFg3.fg, bold = vim.g.gruvbox_italic },
    markdownBold = { fg = base.GruvboxFg3.fg, bold = vim.g.gruvbox_bold },
    markdownBoldItalic = {
        fg = base.GruvboxFg3.fg,
        bold = vim.g.gruvbox_bold,
        italic = vim.g.gruvbox_italic,
    },
    markdownH1 = base.GruvboxGreenBold,
    markdownH2 = { link = 'markdownH1' },
    markdownH3 = base.GruvboxYellowBold,
    markdownH4 = { link = 'markdownH3' },
    markdownH5 = base.GruvboxYellow,
    markdownH6 = { link = 'markdownH5' },
    markdownCode = base.GruvboxAqua,
    markdownCodeBlock = base.GruvboxAqua,
    markdownCodeDelimiter = base.GruvboxAqua,
    markdownBlockquote = base.GruvboxGray,
    markdownListMarker = base.GruvboxGray,
    markdownOrderedListMarker = base.GruvboxGray,
    markdownRule = base.GruvboxGray,
    markdownHeadingRule = base.GruvboxGray,
    markdownUrlDelimiter = base.GruvboxFg3,
    markdownLinkDelimiter = base.GruvboxFg3,
    markdownLinkTextDelimiter = base.GruvboxFg3,
    markdownHeadingDelimiter = base.GruvboxOrange,
    markdownUrl = base.GruvboxPurple,
    markdownUrlTitleDelimiter = base.GruvboxGreen,
    markdownLinkText = { fg = base.GruvboxGray.fg, underline = vim.g.gruvbox_underline },
    markdownIdDeclaration = { link = 'markdownLinkText' },
}

local haskell = {
    haskellType = base.GruvboxBlue,
    haskellIdentifier = base.GruvboxAqua,
    haskellSeparator = base.GruvboxFg4,
    haskellDelimiter = base.GruvboxOrange,
    haskellOperators = base.GruvboxPurple,
    haskellBacktick = base.GruvboxOrange,
    haskellStatement = base.GruvboxPurple,
    haskellConditional = base.GruvboxPurple,
    haskellLet = base.GruvboxRed,
    haskellDefault = base.GruvboxRed,
    haskellWhere = base.GruvboxRed,
    haskellBottom = base.GruvboxRedBold,
    haskellImportKeywords = base.GruvboxPurpleBold,
    haskellDeclKeyword = base.GruvboxOrange,
    haskellDecl = base.GruvboxOrange,
    haskellDeriving = base.GruvboxPurple,
    haskellAssocType = base.GruvboxAqua,
    haskellNumber = base.GruvboxAqua,
    haskellPragma = base.GruvboxRedBold,
    haskellTH = base.GruvboxAquaBold,
    haskellForeignKeywords = base.GruvboxGreen,
    haskellKeyword = base.GruvboxRed,
    haskellFloat = base.GruvboxAqua,
    haskellInfix = base.GruvboxPurple,
    haskellQuote = base.GruvboxGreenBold,
    haskellShebang = base.GruvboxYellowBold,
    haskellLiquid = base.GruvboxPurpleBold,
    haskellQuasiQuoted = base.GruvboxBlueBold,
    haskellRecursiveDo = base.GruvboxPurple,
    haskellQuotedType = base.GruvboxRed,
    haskellPreProc = base.GruvboxFg4,
    haskellTypeRoles = base.GruvboxRedBold,
    haskellTypeForall = base.GruvboxRed,
    haskellPatternKeyword = base.GruvboxBlue,
}

local html = {
    htmlTag = base.GruvboxAquaBold,
    htmlEndTag = base.GruvboxAquaBold,
    htmlTagName = base.GruvboxBlue,
    htmlArg = base.GruvboxOrange,
    htmlTagN = base.GruvboxFg1,
    htmlSpecialTagName = base.GruvboxBlue,
    htmlLink = { fg = colors.fg4, underline = vim.g.gruvbox_underline },
    htmlSpecialChar = { link = 'GruvboxRed' },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = vim.g.gruvbox_bold },
    htmlBoldUnderline = {
        fg = colors.fg0,
        bg = colors.bg0,
        bold = vim.g.gruvbox_bold,
        underline = vim.g.gruvbox_underline,
    },
    htmlBoldItalic = {
        fg = colors.fg0,
        bg = colors.bg0,
        bold = vim.g.gruvbox_bold,
        italic = vim.g.gruvbox_italic,
    },
    htmlBoldUnderlineItalic = {
        fg = colors.fg0,
        bg = colors.bg0,
        bold = vim.g.gruvbox_bold,
        italic = vim.g.gruvbox_italic,
        underline = vim.g.gruvbox_underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = vim.g.gruvbox_underline },
    htmlUnderlineItalic = {
        fg = colors.fg0,
        bg = colors.bg0,
        italic = vim.g.gruvbox_italic,
        underline = vim.g.gruvbox_underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, bold = vim.g.gruvbox_italic },
}

local langs = merge({
    xml,
    purescript,
    coffeescript,
    objc,
    moonscript,
    elixir,
    markdown,
    haskell,
    html,
})

local specs = { base, langs, plugins }
local spec = merge(specs)

add_highlights(spec)
