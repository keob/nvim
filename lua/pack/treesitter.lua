require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'c',
        'cpp',
        'go',
        'gomod',
        'gowork',
        'rust',
        'lua',
        'vim',
        'make',
        'cmake',
        'ninja',
        'proto',
        'python',
    },
    sync_install = true,
    highlight = {
        enable = true,
        disable = {},
    },
})
