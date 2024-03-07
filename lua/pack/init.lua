local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            require('pack.cmp')
        end,
    },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('pack.lsp')
        end,
    },
    {
        'dcampos/nvim-snippy',
        dependencies = {
            'dcampos/cmp-snippy',
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            local opts = require('pack.treesitter')
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            local opts = require('pack.telescope')
            require('telescope').setup(opts)
        end,
    },
    {
        'echasnovski/mini.pairs',
        event = 'VeryLazy',
        config = function()
            local opts = require('pack.pairs')
            require('mini.pairs').setup(opts)
        end,
    },
    {
        'echasnovski/mini.surround',
        config = function()
            local opts = require('pack.surround')
            require('mini.surround').setup(opts)
        end,
    },
    {
        'echasnovski/mini.comment',
        event = 'VeryLazy',
        config = function()
            require('mini.comment').setup({})
        end,
    },
}, {
    install = {
        colorscheme = { 'dracula' },
    },
    ui = {
        border = 'rounded',
    },
})
