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
        path_display = { 'absolute' },
        file_ignore_patterns = {
            '%.o',
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
            '.cache/',
            'build/',
            'target/',
            'node_modules/',
        },
        layout_config = {
            prompt_position = 'top',
        },
    },
})
