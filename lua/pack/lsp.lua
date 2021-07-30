local api = vim.api
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

vim.fn.sign_define("LspDiagnosticsSignError", {text = "➤", texthl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "»", texthl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "≡", texthl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "•", texthl = "LspDiagnosticsSignHint"})

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
    '鬒 Event',         -- Event
    'Ψ Operator',       -- Operator
    ' Type Parameter', -- TypeParameter
}

local enhance_attach = function(client, bufnr)
    -- local ns = { noremap = true, silent = true }
    --
    -- local function buf_set_keymap(...) api.nvim_buf_set_keymap(bufnr, ...) end
    -- local function buf_set_option(...) api.nvim_buf_set_option(bufnr, ...) end
    --
    -- if client.resolved_capabilities.document_formatting then
    --     buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", ns)
    -- elseif client.resolved_capabilities.document_range_formatting then
    --     buf_set_keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", ns)
    -- end

    api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.gopls.setup({
    cmd = { "gopls", "serve" },
    filetypes = {"go"},
    on_attach = enhance_attach,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                nonewvars = true,
                fillreturns = true,
                undeclaredname = true,
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
        "--background-index",
        "--clang-tidy",
        "--cross-file-rename",
        "--header-insertion=iwyu"
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
    on_attach = enhance_attach,
    init_options = {
        clangdFileStatus = true
    }
})

lspconfig.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = {"python"},
    on_attach = enhance_attach,
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
        "javascriptreact",
        "typescriptreact",
    },
    on_attach = enhance_attach,
})
