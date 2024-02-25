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

local enhance_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>aw', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>rw', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>lw', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>ff', function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { 'markdown', 'plaintext' },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        },
    },
}

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
        '--all-scopes-completion',
        '--background-index',
        '--clang-tidy',
        '--completion-style=detailed',
        '--header-insertion=iwyu',
        '--enable-config',
        '--pch-storage=memory',
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
            imports = {
                granularity = {
                    group = 'module',
                },
                prefix = 'self',
            },
            checkOnSave = {
                command = 'clippy',
            },
            procMacro = {
                enable = true,
            },
        },
    },
})

lspconfig.neocmake.setup({
    cmd = { 'neocmakelsp', '--stdio' },
    filetypes = { 'cmake' },
    flags = lsp_flags,
    on_attach = enhance_attach,
    capabilities = capabilities,
    single_file_support = true,
    init_options = {
        format = {
            enable = true,
        },
    },
})
