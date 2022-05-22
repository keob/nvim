require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'c',
        'cpp',
        'go',
        'nix',
        'gomod',
        'gowork',
        'rust',
        'lua',
        'vim',
        'json',
        'toml',
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
