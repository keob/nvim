local config = {}

function config.comment()
    require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
            line = "gcc",
            block = "gbc",
        },
        opleader = {
            line = "gc",
            block = "gb",
        },
        extra = {
            above = "gcO",
            below = "gco",
            eol = "gcA",
        },
        mappings = {
            basic = true,
            extra = true,
            extended = false,
        },
    })
end

function config.autopairs()
    require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },
        disable_in_macro = false,
        disable_in_visualblock = false,
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
        check_ts = false,
        map_bs = true, -- map the <BS> key
        map_c_h = true, -- map the <C-h> key to delete a pair
        map_c_w = true, -- map <c-w> to delete a pair if possible
    })
end

function config.nvim_lsp()
    require("pack.lsp")
end

function config.treesitter()
    require("nvim-treesitter.configs").setup({
        ensure_installed = "maintained",
        highlight = {
            enable = true,
            disable = {},
        },
    })
end

function config.vim_vsnip()
    vim.g.vsnip_snippet_dir = os.getenv("HOME") .. "/.config/nvim/snippets"
end

function config.telescope()
    local actions = require("telescope.actions")
    require("telescope").setup({
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--crlf",
                "--follow",
                "--hidden",
                "--smart-case",
                "--column",
                "--no-heading",
                "--with-filename",
            },
            mappings = {
                n = {
                    ["q"] = actions.close,
                },
            },
            history = false,
            prompt_prefix = "» ",
            selection_caret = "› ",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            scroll_strategy = "cycle",
            layout_strategy = "horizontal",
            file_ignore_patterns = {
                ".git/",
                ".cache/",
                ".venv/",
                "node_modules/",
                "target/",
                "build/",
            },
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
            },
        },
    })
end

return config
