local opt = vim.opt
local global = require('core.global')

vim.cmd[[colorscheme gruvbox]]

local function load_options()
    local global_local = {
        mouse = "nv";
        bg = "dark";
        ar = true;
        aw = true;
        awa = true;
        termguicolors = true;
        virtualedit = "block";
        joinspaces = false;
        modelines = 1;
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
        wildignorecase = true;
        wildignore = "*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip";
        backup = false;
        writebackup = false;
        directory  = global.cache_dir .. "swap/";
        undodir = global.cache_dir .. "undo/";
        backupdir = global.cache_dir .. "backup/";
        viewdir = global.cache_dir .. "view/";
        history = 2000;
        shada = "!,'1000,<50,s10,h";
        timeout = true;
        ttimeout = true;
        timeoutlen = 500;
        ttimeoutlen = 10;
        updatetime = 300;
        lazyredraw = true;
        ignorecase = true;
        smartcase = true;
        incsearch = true;
        wrapscan = true;
        grepprg = "rg --hidden --vimgrep --smart-case --";
        grepformat = "%f:%l:%c:%m";
        startofline = false;
        whichwrap = "h,l,<,>,[,],~";
        splitbelow = true;
        splitright = true;
        switchbuf = "useopen";
        backspace = "indent,eol,start";
        diffopt = "filler,iwhite,internal,algorithm:patience";
        completeopt = "menuone,noselect";
        inccommand = "split";
        jumpoptions = "stack";
        showmode = false;
        showmatch = true;
        showcmd = false;
        shiftround = true;
        shortmess = "aoOTWIcF";
        scrolloff = 2;
        sidescrolloff = 5;
        foldlevelstart = 99;
        ruler = false;
        listchars = "tab:› ,trail:•";
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
        display = "lastline";
        statusline = " %t%r%m %= %y [ %l • %v ] [ %p%% ] ";
    }

    local window_local = {
        list = true;
        scl = "yes";
        nu = true;
        rnu = true;
        linebreak = true;
        wrap = true;
        conceallevel = 2;
        concealcursor = "niv";
        foldenable = true;
        foldmethod = "indent";
        cursorline = false;
        fillchars = "eob:~";
        breakindentopt = "shift:2,min:20";
    }

    local buffer_local = {
        swf = false;
        udf = true;
        fo = "1jcroql";
        infercase = true;
        complete = ".,w,b,u,t";
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
