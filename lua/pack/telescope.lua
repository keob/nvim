local ok, telescope = pcall(require, 'telescope')
if not ok then
    return
end

local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
require('telescope').setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--hidden',
            '--smart-case',
            '--trim',
        },
        mappings = {
            i = {
                ['<M-m>'] = action_layout.toggle_mirror,
                ['<M-p>'] = action_layout.toggle_preview,
            },
            n = {
                ['q'] = actions.close,
            },
        },
        winblend = 0,
        history = false,
        entry_prefix = '  ',
        prompt_prefix = '» ',
        selection_caret = '  ',
        color_devicons = true,
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        scroll_strategy = 'cycle',
        path_display = {
            truncate = {
                len = 3,
            },
        },
        file_ignore_patterns = {
            '%.o',
            '%.so',
            '%.obj',
            '%.exe',
            '%.out',
            '%.pyc',
            '%.gif',
            '%.png',
            '%.jpg',
            '%.jpeg',
            '%.zip',
            '%.data',
            '.git/',
            'build/',
            'target/',
            '.xmake/',
            '.cache/',
            '_log',
            '_deps',
            'node_modules/',
        },
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'top',
            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.5)
                    else
                        return math.floor(cols * 0.5)
                    end
                end,
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            -- find_command = { "fd" },
        },
    },
})
