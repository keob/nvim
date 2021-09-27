local opt = vim.opt
local global = require('core.global')

vim.cmd[[colorscheme dracula]]

local function load_options()
    local global_local = {
        mouse = "nv";
        bg = "dark";
        ar = true;
        aw = true;
        awa = true;
        exrc = true;
        secure = true;
        gdefault = true;
        mousefocus = true;
        termguicolors = true;
        virtualedit = "block";
        joinspaces = false;
        icm = "split";
        breakindent = true;
        errorbells = false;
        visualbell = false;
        hidden = true;
        fileformats = "unix,mac,dos";
        encoding = "utf-8";
        viewoptions = "folds,cursor,curdir,slash,unix";
        sessionoptions = "curdir,help,tabpages,winsize";
        clipboard = "unnamedplus";
        wildoptions = "pum";
        wildignorecase = true;
        wildignore = "*.pyc,*.o,*.obj,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip";
        backup = false;
        writebackup = false;
        directory  = global.cache_dir .. "swap/";
        undodir = global.cache_dir .. "undo/";
        backupdir = global.cache_dir .. "backup/";
        viewdir = global.cache_dir .. "view/";
        history = 2000;
        timeout = true;
        ttimeout = true;
        timeoutlen = 500;
        ttimeoutlen = 10;
        updatetime = 300;
        lazyredraw = true;
        ignorecase = true;
        smartcase = true;
        hlsearch = false;
        incsearch = true;
        wrapscan = true;
        grepprg = "rg --hidden --crlf --follow --vimgrep --smart-case --";
        grepformat = "%f:%l:%c:%m";
        startofline = false;
        whichwrap = "h,l,<,>,[,],~";
        splitbelow = true;
        splitright = true;
        eadirection = "hor";
        foldopen = vim.opt.foldopen + 'search';
        -- switchbuf = "useopen";
        backspace = "indent,eol,start";
        diffopt = "filler,iwhite,internal,algorithm:patience";
        completeopt = "menu,menuone,noselect";
        inccommand = "split";
        jumpoptions = "stack";
        showmode = false;
        showmatch = true;
        showcmd = false;
        shiftround = true;
        shortmess = {
            a = true,
            o = true,
            O = true,
            s = true,
            t = true,
            T = true,
            W = true,
            A = true,
            I = true,
            c = true,
            F = true,
        };
        scrolloff = 1;
        sidescrolloff = 5;
        foldlevelstart = 10;
        ruler = false;
        listchars = {
            eol = nil,
            tab = '··›',
            trail = '•',
            extends = '»',
            precedes = '«'
        };
        showtabline = 1;
        winwidth = 30;
        winminwidth = 10;
        pumblend = 10;
        winblend = 10;
        pumheight = 15;
        helpheight = 12;
        previewheight = 12;
        cmdheight = 1;
        cmdwinheight = 5;
        equalalways = false;
        laststatus = 2;
        statusline = " %t%r%m %= %y [ %l • %v ] [ %p%% ] ";
    }

    local window_local = {
        list = true;
        scl = "yes:1";
        nu = true;
        rnu = true;
        linebreak = true;
        wrap = true;
        conceallevel = 2;
        concealcursor = "niv";
        foldenable = true;
        foldmethod = "indent";
        cursorline = false;
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
        swf = false;
        udf = true;
        fo = "croql1j";
        wrapmargin = 2;
        infercase = true;
        complete = ".,w,b,u,],t";
        synmaxcol = 2500;
        textwidth = 100;
        expandtab = true;
        autoindent = true;
        tabstop = 4;
        shiftwidth = 4;
        softtabstop = 4;
        smartindent = true;
    }

    vim.g.loaded_python_provider = 0
    vim.g.python3_host_skip_check = 1
    vim.g.python3_host_prog = '/usr/bin/python3'

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
