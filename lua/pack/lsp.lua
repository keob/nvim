local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return
end

vim.lsp.set_log_level(2)

local signs = {
    { name = 'DiagnosticSignInfo', text = '≡' },
    { name = 'DiagnosticSignHint', text = '•' },
    { name = 'DiagnosticSignWarn', text = '›' },
    { name = 'DiagnosticSignError', text = '»' },
}

for _, sign in pairs(signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = sign.name })
end

local diagnostic_config = {
    signs = true,
    underline = false,
    virtual_text = false,
    severity_sort = true,
    update_in_insert = true,
    float = {
        focused = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
}

vim.diagnostic.config(diagnostic_config)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
    debounce_text_changes = 150,
}

lspconfig.gopls.setup({
    cmd = { 'gopls', 'serve' },
    filetypes = { 'go', 'gomod', 'gowork' },
    flags = lsp_flags,
    on_attach = enhance_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                useany = true,
                nilness = true,
                unusedwrite = true,
                unusedparams = true,
                unusedvariable = true,
            },
            -- gofumpt = true,
            staticcheck = true,
            linksInHover = false,
            usePlaceholders = true,
        },
    },
})

lspconfig.clangd.setup({
    cmd = {
        'clangd',
        '-j=6',
        '--all-scopes-completion',
        '--background-index',
        '--clang-tidy',
        '--completion-style=detailed',
        '--header-insertion=iwyu',
        '--enable-config',
        '--pch-storage=disk',
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    flags = lsp_flags,
    on_attach = enhance_attach,
    capabilities = capabilities,
    single_file_support = true,
})

lspconfig.rust_analyzer.setup({
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    flags = lsp_flags,
    on_attach = enhance_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                autoreload = true,
            },
            checkOnSave = {
                command = 'clippy',
            },
        },
    },
})
