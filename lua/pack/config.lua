local config = {}

function config.nvim_lsp()
    require("pack.lsp")
end

function config.vim_vsnip()
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end

function config.telescope()
    local actions = require("telescope.actions")
    require("telescope").setup {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--crlf",
                "--follow",
                "--hidden",
                "--smart-case",
                "--column",
                "--no-heading",
                "--with-filename"
            },
            mappings = {
                n = {
                    ["<Esc>"] = actions.close
                }
            },
            history = false,
            prompt_prefix = "» ",
            selection_caret = "› ",
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
