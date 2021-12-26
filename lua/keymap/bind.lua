local bind = {}

local opts = { noremap = true, silent = true }

-- Normal, Visual, Select, Operator-pending
function bind.map(mode, key, command)
    vim.api.nvim_set_keymap(mode, key, command, opts)
end

-- Normal
function bind.nmap(key, command)
    bind.map("n", key, command)
end

-- Visual and Select
function bind.vmap(key, command)
    bind.map("v", key, command)
end

-- Select
function bind.smap(key, command)
    bind.map("s", key, command)
end

-- Visual
function bind.xmap(key, command)
    bind.map("x", key, command)
end

-- Operator-pending
function bind.omap(key, command)
    bind.map("o", key, command)
end

-- Insert and Command-line
function bind.icmap(key, command)
    bind.map("!", key, command)
end

-- Insert
function bind.imap(key, command)
    bind.map("i", key, command)
end

-- Insert, Command-line, Lang-Arg
function bind.lmap(key, command)
    bind.map("l", key, command)
end

-- Command-line
function bind.cmap(key, command)
    bind.map("c", key, command)
end

-- Terminal
function bind.tmap(key, command)
    bind.map("t", key, command)
end

return bind
