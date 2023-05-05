vim.cmd('packadd packer.nvim')

return require('packer').startup({
    function(use)
        use({ 'wbthomason/packer.nvim' })

        use({
            'neovim/nvim-lspconfig',
        })

        use({
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-vsnip',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-nvim-lsp',
            },
        })

        use({
            'hrsh7th/vim-vsnip',
        })

        use({
            'nvim-treesitter/nvim-treesitter',
            -- run = ':TSUpdate',
        })

        use({
            'nvim-telescope/telescope.nvim',
            requires = {
                { 'nvim-lua/popup.nvim' },
                { 'nvim-lua/plenary.nvim' },
                { 'kyazdani42/nvim-web-devicons' },
            },
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end,
        },
        git = {
            clone_timeout = 300,
            subcommands = {
                update = 'pull --rebase',
            },
        },
        auto_clean = true,
        compile_on_sync = true,
    },
})
