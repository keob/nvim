local api = vim.api
local cmp = require('cmp')
local lspconfig = require("lspconfig")

vim.lsp.set_log_level("warn")

function _G.open_lsp_log()
    local path = vim.lsp.get_log_path()
    vim.cmd("edit " .. path)
end

function _G.reload_lsp()
    vim.lsp.stop_client(vim.lsp.get_active_clients())
    vim.cmd("edit")
end

local signs = { Error = "»", Warning = "›", Hint = "•", Information = "≡" }

for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    -- virtual_text = {
    --     spacing = 4,
    --     prefix = '≡',
    -- },
    signs = true,
    update_in_insert = false,
}
)

require('vim.lsp.protocol').CompletionItemKind = {
    '𝍢  Text',          -- Text
    ' Method',         -- Method
    'ƒ Function',       -- Function
    '  Constructor',   -- Constructor
    '識 Field',         -- Field
    '  Variable',      -- Variable
    '  Class',         -- Class
    'ﰮ  Interface',     -- Interface
    '  Module',        -- Module
    '  Property',      -- Property
    '  Unit',          -- Unit
    '  Value',         -- Value
    '了 Enum',          -- Enum
    '  Keyword',       -- Keyword
    '  Snippet',       -- Snippet
    '  Color',         -- Color
    '  File',          -- File
    '渚 Reference',     -- Reference
    '  Folder',        -- Folder
    '  Enum',          -- Enum
    '  Constant',      -- Constant
    '  Struct',        -- Struct
    ' Event',          -- Event
    'ﬦ Operator',       -- Operator
    ' Type Parameter', -- TypeParameter
}

local enhance_attach = function(client, bufnr)
    api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    completion = {
        keyword_length = 1,
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-]>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-[>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    },
    experimental = {
        ghost_text = false,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    })
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.gopls.setup({
    cmd = { "gopls", "serve" },
    filetypes = {"go"},
    on_attach = enhance_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                unusedwrite = true,
            },
            staticcheck = true,
            linksInHover = false,
        },
    }
})

lspconfig.rust_analyzer.setup({
    cmd = { "rust-analyzer" },
    filetypes = {"rust"},
    on_attach = enhance_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                autoreload = true,
                loadOutDirsFromCheck = true,
            },
            diagnostics = {
                disabled = {
                    "unresolved-macro-call",
                }
            },
            hoverActions = {
                linksInHover = false,
            },
            procMacro = {
                enable = true,
            }
        }
    }
})

lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "-j=6",
        "--compile-commands-dir=build",
        "--all-scopes-completion",
        "--enable-config",
        "--background-index",
        "--clang-tidy",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion=iwyu"
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    on_attach = enhance_attach,
    capabilities = capabilities,
    root_dir = vim.loop.cwd,
    init_options = {
        clangdFileStatus = true
    }
})

lspconfig.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = {"python"},
    on_attach = enhance_attach,
    capabilities = capabilities,
    root_dir = vim.loop.cwd,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true;
                useLibraryCodeForTypes = true;
            }
        }
    }
})

lspconfig.tsserver.setup({
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "typescript",
        "javascript.jsx",
        "typescript.tsx",
        "javascriptreact",
        "typescriptreact",
    },
    on_attach = enhance_attach,
    capabilities = capabilities,
    root_dir = vim.loop.cwd,
})
