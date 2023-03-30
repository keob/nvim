local fmt = string.format

local nvim_options = {
    mouse = 'nv',
    background = 'dark',
    termguicolors = true,
    fileformats = 'unix,mac,dos',
    encoding = 'utf-8',
    viewoptions = 'folds,cursor,curdir,slash,unix',
    sessionoptions = 'curdir,help,tabpages,winsize',
    clipboard = 'unnamedplus',
    wildignorecase = true,
    wildignore = '*.pyc,*.o,*.obj,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip',
    backup = false,
    writebackup = false,
    undofile = true,
    swapfile = false,
    history = 2000,
    shada = "!,'1000,<50,s10,h",
    timeoutlen = 500,
    ttimeoutlen = 10,
    updatetime = 100,
    redrawtime = 1500,
    lazyredraw = true,
    smartcase = true,
    ignorecase = true,
    hlsearch = true,
    grepformat = '%f:%l:%c:%m',
    whichwrap = 'b,s,h,l,<,>,[,],~',
    splitbelow = true,
    splitright = true,
    switchbuf = 'useopen',
    diffopt = 'internal,filler,closeoff,hiddenoff,algorithm:minimal',
    completeopt = 'menu,menuone,noselect',
    jumpoptions = 'stack',
    showmatch = true,
    showmode = false,
    showcmd = false,
    shortmess = {
        a = true,
        o = true,
        O = true,
        s = true,
        T = true,
        I = true,
        c = true,
        F = true,
    },
    scrolloff = 2,
    sidescrolloff = 2,
    foldlevelstart = 99,
    ruler = false,
    list = true,
    listchars = {
        eol = nil,
        tab = '› ',
        -- lead = '·',
        trail = '•',
        extends = '»',
        precedes = '«',
    },
    showtabline = 1,
    winwidth = 30,
    winminwidth = 10,
    pumblend = 10,
    pumheight = 15,
    winblend = 10,
    helpheight = 15,
    previewheight = 12,
    cmdheight = 1,
    cmdwinheight = 5,
    equalalways = true,
    display = 'lastline',
    laststatus = 2,
    statusline = ' %t%r%m %= %y [ %l • %v ] [ %p%% ] ',
    -- signcolumn = 'yes',
    number = true,
    relativenumber = true,
    linebreak = true,
    wrap = false,
    conceallevel = 0,
    concealcursor = 'niv',
    foldmethod = 'indent',
    cursorline = false,
    breakindent = true,
    breakindentopt = 'sbr',
    fillchars = {
        vert = ' ',
        fold = ' ',
        eob = ' ',
        diff = '-',
        msgsep = ' ',
        foldsep = '|',
        foldopen = '-',
        foldclose = '+',
    },
    formatoptions = 'crqnj',
    infercase = true,
    complete = '.,w,b,u,],t',
    synmaxcol = 3000,
    textwidth = 80,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    smarttab = true,
    expandtab = true,
    autoindent = true,
    smartindent = true,
}

for name, value in pairs(nvim_options) do
    vim.opt[name] = value
end
