require('nvim-autopairs').setup({
    disable_filetype = { 'TelescopePrompt' },
    disable_in_macro = false,
    disable_in_visualblock = false,
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = true,
    check_ts = false,
    map_bs = true, -- map the <BS> key
    map_c_h = true, -- map the <C-h> key to delete a pair
    map_c_w = true, -- map <c-w> to delete a pair if possible
})
