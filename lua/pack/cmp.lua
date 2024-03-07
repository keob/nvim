local fmt = string.format

local ok, cmp = pcall(require, 'cmp')
if not ok then
    return
end

local ok, snippy = pcall(require, 'snippy')
if not ok then
    return
end

local icons = {
    Text = ' 󰉿 ',
    Method = ' 󰆧 ',
    Function = ' 󰊕 ',
    Constructor = '  ',
    Field = ' 󰜢 ',
    Variable = ' 󰀫 ',
    Class = ' 󰠱 ',
    Interface = '  ',
    Module = '  ',
    Property = ' 󰜢 ',
    Unit = ' 󰑭 ',
    Value = ' 󰎠 ',
    Enum = ' ',
    Keyword = ' 󰌋 ',
    Snippet = '  ',
    Color = ' 󰏘 ',
    File = ' 󰈙 ',
    Reference = ' 󰈇 ',
    Folder = ' 󰉋 ',
    EnumMember = '  ',
    Constant = ' 󰏿 ',
    Struct = ' 󰙅 ',
    Event = '  ',
    Operator = ' 󰆕 ',
    TypeParameter = '  ',
}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
            == nil
end

cmp.setup({
    completion = {
        completeopt = 'menu,menuone',
    },
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true, }),
        ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
        end,
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    window = {
        completion = cmp.config.window.bordered({ scrollbar = false }),
        documentation = cmp.config.window.bordered({ scrollbar = false }),
    },
    formatting = {
        format = function(entry, item)
            if icons[item.kind] then
                item.kind = icons[item.kind] .. item.kind
            end
            -- item.kind = fmt('%s %s', icons[item.kind], item.kind)
           -- item.menu = ({
           --     nvim_lsp = 'LSP',
           --     path = 'Path',
           --     buffer = 'Buffer',
           --     vsnip = 'Snippet',
           -- })[entry.source.name]
            return item
        end,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' },
        { name = 'buffer' },
        { name = 'path' },
    }),
})

cmp.setup.cmdline({ '/', '?' }, {
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
