local config = {}

-- nvim_lsp
function config.nvim_lsp()
    require('pack.lsp')
end

-- nvim_compe
function config.nvim_compe()
    require'compe'.setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = 'always';
        documentation = true;
        source = {
            nvim_lsp = { priority = 1000; };
            nvim_lua = { priority = 1000; };
            vsnip = { priority = 1000; };
            buffer = { priority = 500; };
            calc = { priority = 500; };
            sort = { priority = 500; };
            tags = { priority = 500; };
            path = { priority = 500; };
        };
    }
end

-- vsnip
function config.vim_vsnip()
    vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
end

-- emmet
function config.emmet()
    vim.g.user_emmet_mode = 'inv'
end

-- telescope
function config.telescope()
    require('telescope').setup {
        defaults = {
            prompt_position = "top",
            prompt_prefix = "» ",
            selection_caret = "› ",
            sorting_strategy = 'ascending',
            layout_strategy = "horizontal",
            file_ignore_patterns = {'node_modules/*', 'target/*'}
        },
    }
end

-- delimimate
function config.delimimate()
    vim.g.delimitMate_expand_cr = 0
    vim.g.delimitMate_expand_space = 1
    vim.g.delimitMate_smart_quotes = 1
    vim.g.delimitMate_expand_inside_quotes = 0
end

return config
