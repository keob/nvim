require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'rust' },
    sync_install = true,
    highlight = {
        enable = true,
        disable = {},
    },
})
