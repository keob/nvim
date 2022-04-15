local bind = {}

function bind.map(mode, keys, command, opt)
    local options = { noremap = true, silent = true }

    if opt then
        options = vim.tbl_extend('force', options, opt)
    end

    vim.api.nvim_set_keymap(mode, keys, command, options)
end

return bind
