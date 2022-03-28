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
        history = false,
        prompt_prefix = '» ',
        selection_caret = '› ',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        scroll_strategy = 'cycle',
        layout_strategy = 'horizontal',
        file_ignore_patterns = {
            '.git/',
            '.cache/',
            '.venv/',
            'node_modules/',
            'target/',
            'build/',
        },
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
