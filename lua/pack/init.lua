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
    },
    {
        'echasnovski/mini.surround',
        keys = {},
        opts = {},
    },
    {
        'echasnovski/mini.comment',
        event = 'VeryLazy',
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        cmd = 'Neotree',
        config = function()
            local opts = require('pack.neotree')
            require('neo-tree').setup(opts)
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        config = function()
            local opts = require('pack.lualine')
            require('lualine').setup(opts)
        end,
    },
})
