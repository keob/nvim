local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

treesitter.setup({
    ensure_installed = {
        'c',
        'go',
        'cpp',
        'lua',
        'vim',
        'rust',
        'toml',
        'proto',
        'gomod',
        'gowork',
        'python',
    },
    sync_install = true,
    indent = {
        enable = false,
    },
    highlight = {
        enable = true,
        disable = {},
    },
    incremental_selection = {
        enable = true,
    },
})
