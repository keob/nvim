local opt = vim.opt
local global = require('core.global')

vim.cmd[[colorscheme dracula]]

local function load_options()
    local global_local = {
        mouse = "nv";
        background = "dark";
        autoread = true;
        autowrite = true;
        autowriteall= true;
        exrc = true;
        magic = true;
        secure = true;
        gdefault = true;
        mousefocus = true;
        termguicolors = true;
        joinspaces = false;
        errorbells = false;
        visualbell = false;
        hidden = true;
        fileformats = "unix,mac,dos";
        encoding = "utf-8";
        viewoptions = "folds,cursor,curdir,slash,unix";
        sessionoptions = "curdir,help,tabpages,winsize";
        clipboard = "unnamedplus";
        wildignorecase = true;
        wildignore = "*.pyc,*.o,*.obj,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip";
        backup = false;
        writebackup = false;
        directory  = global.cache_dir .. "swap/";
        undodir = global.cache_dir .. "undo/";
        backupdir = global.cache_dir .. "backup/";
        viewdir = global.cache_dir .. "view/";
        history = 2000;
        shada = "!,'300,<50,@100,s10,h";
        smarttab = true;
        timeout = true;
        ttimeout = true;
        timeoutlen = 500;
        ttimeoutlen = 10;
        updatetime = 100;
        redrawtime = 1500;
        lazyredraw = true;
        smartcase = true;
        ignorecase = true;
        hlsearch = false;
        incsearch = true;
        wrapscan = true;
        grepprg = "rg --hidden --crlf --follow --vimgrep --smart-case --";
        grepformat = "%f:%l:%c:%m";
        -- whichwrap = "b,s,h,l,<,>,[,],~";
        splitbelow = true;
        splitright = true;
        eadirection = "hor";
        switchbuf = "useopen";
        backspace = "indent,eol,start";
        diffopt = "filler,iwhite,internal,algorithm:patience";
        completeopt = "menu,menuone,noselect";
        inccommand = "split";
        jumpoptions = "stack";
        showmatch = false;
        showmode = false;
        showcmd = false;
        shiftround = true;
        shortmess = {
            a = true,
            o = true,
            O = true,
            s = true,
            T = true,
            I = true,
            c = true,
            F = true,
        };
        scrolloff = 1;
        sidescrolloff = 1;
        foldlevelstart = 99;
        ruler = false;
        listchars = {
            eol = nil,
            tab = '··›',
            -- lead = '·',
            trail = '•',
            extends = '»',
            precedes = '«'
        };
        showtabline = 1;
        winwidth = 30;
        winminwidth = 10;
        pumblend = 10;
        pumheight = 15;
        winblend = 10;
        helpheight = 15;
        previewheight = 12;
        cmdheight = 1;
        cmdwinheight = 5;
        equalalways = false;
        display = "lastline";
        laststatus = 2;
        statusline = " %t%r%m %= %y [ %l • %v ] [ %p%% ] ";
    }

    local window_local = {
        list = true;
        signcolumn = "yes:1";
        number = true;
        relativenumber = true;
        linebreak = true;
        wrap = true;
        conceallevel = 2;
        concealcursor = "niv";
        foldenable = true;
        foldmethod = "indent";
        cursorline = false;
        breakindent = true;
        breakindentopt = "sbr";
        fillchars = {
            vert = ' ',
            fold = ' ',
            eob = ' ',
            diff = '-',
            msgsep = ' ',
            foldsep = '|',
            foldopen = '-',
            foldclose = '+',
        }
    }

    local buffer_local = {
        swapfile = false;
        undofile = true;
        formatoptions = "croql1j";
        infercase = true;
        complete = ".,w,b,u,],t";
        synmaxcol = 3000;
        textwidth = 80;
        tabstop = 4;
        shiftwidth = 4;
        softtabstop = 4;
        expandtab = true;
        autoindent = true;
        smartindent = true;
    }

    for name, value in pairs(global_local) do
        opt[name] = value
    end

    for name, value in pairs(window_local) do
        opt[name] = value
    end

    for name, value in pairs(buffer_local) do
        opt[name] = value
    end
end

load_options()
