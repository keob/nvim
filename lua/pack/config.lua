local config = {}

function config.nvim_lsp()
    require("pack.lsp")
end

function config.nvim_compe()
    require"compe".setup {
        enabled = true;
        autocomplete = true;
        debug = false;
        min_length = 1;
        preselect = "always";
        documentation = true;
        source = {
            nvim_lsp = { priority = 2000; };
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

function config.vim_vsnip()
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end

function config.telescope()
    local actions = require("telescope.actions")
    require("telescope").setup {
        defaults = {
            mappings = {
                n = {
                    ["q"] = actions.close
                }
            },
            history = false,
            prompt_prefix = "» ",
            selection_caret = "› ",
            winblend = 0,
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            scroll_strategy = "cycle",
            layout_strategy = "horizontal",
            file_ignore_patterns = {".git/", ".cache/", ".venv/", "node_modules/", "target/", "build/"},
            layout_config = {
                prompt_position = "top",
                horizontal = {
                    preview_width = function(_, cols, _)
                        if cols > 200 then
                            return math.floor(cols * 0.4)
                        else
                            return math.floor(cols * 0.6)
                        end
                    end,
                },
            }
        },
    }
end

function config.delimimate()
    vim.g.delimitMate_expand_cr = 0
    vim.g.delimitMate_expand_space = 1
    vim.g.delimitMate_smart_quotes = 1
    vim.g.delimitMate_expand_inside_quotes = 0
end

return config
