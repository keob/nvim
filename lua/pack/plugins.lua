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
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline',
                'hrsh7th/cmp-nvim-lsp',
            },
        })

        use({ 'dcampos/nvim-snippy' })

        use({ 'dcampos/cmp-snippy' })

        use({
            'nvim-treesitter/nvim-treesitter',
            -- run = ':TSUpdate',
        })

        use({ 'nvim-telescope/telescope.nvim' })

        use({ 'nvim-lua/popup.nvim' })

        use({ 'nvim-lua/plenary.nvim' })

        use({ 'kyazdani42/nvim-web-devicons' })
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
