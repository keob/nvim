local actions = require('telescope.actions')
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
        },
        mappings = {
            n = {
                ['q'] = actions.close,
            },
        },
        winblend = 0,
        history = false,
        entry_prefix = '  ',
        prompt_prefix = '» ',
        selection_caret = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        scroll_strategy = 'cycle',
        layout_strategy = 'horizontal',
        path_display = { 'truncate' },
        file_ignore_patterns = { '.git', 'node_modules', 'build', 'target' },
        layout_config = {
            prompt_position = 'top',
            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.4)
                    else
                        return math.floor(cols * 0.6)
                    end
                end,
            },
        },
    },
})
