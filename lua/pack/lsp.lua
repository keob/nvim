local fmt = string.format

local api = vim.api
local cmp = require('cmp')
local lspconfig = require('lspconfig')

vim.lsp.set_log_level(2)

local signs = {
    { name = 'DiagnosticSignError', text = '»' },
    { name = 'DiagnosticSignWarn', text = '›' },
    { name = 'DiagnosticSignHint', text = '•' },
    { name = 'DiagnosticSignInfo', text = '≡' },
}

for _, sign in pairs(signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = sign.name })
end

local kind_presets = {
    Text = '  ',
    Method = '  ',
    Function = '  ',
    Constructor = '  ',
    Field = ' ﰠ ',
    Variable = '  ',
    Class = ' ﴯ ',
    Interface = ' ﰮ ',
    Module = '  ',
    Property = ' ﰠ ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

local diagnostic_config = {
    signs = true,
    underline = false,
    virtual_text = false,
    severity_sort = true,
    update_in_insert = true,
}

vim.diagnostic.config(diagnostic_config)

local enhance_attach = function(client, bufnr)
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
            == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn['vsnip#available'](1) == 1 then
                feedkey('<Plug>(vsnip-expand-or-jump)', '')
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                feedkey('<Plug>(vsnip-jump-prev)', '')
            end
        end, { 'i', 's' }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = fmt('%s %s', kind_presets[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = 'LSP',
                path = 'Path',
                buffer = 'Buffer',
                vsnip = 'Snippet',
            })[entry.source.name]
            return vim_item
        end,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local lsp_flags = {
  debounce_text_changes = 150,
}

lspconfig.gopls.setup({
    cmd = { 'gopls', 'serve' },
    filetypes = { 'go' },
    flags = lsp_flags,
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
        '--inlay-hints',
        '--enable-config',
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
                -- features = { 'all' },
            },
        },
    },
})
