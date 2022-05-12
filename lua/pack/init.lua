vim.cmd('packadd packer.nvim')

return require('packer').startup({
    function()
        local load_config = function(name)
            return string.format("require'pack.%s'", name)
        end

        use({ 'wbthomason/packer.nvim' })

        use({
            'numToStr/Comment.nvim',
            config = load_config('comment'),
        })

        use({
            'windwp/nvim-autopairs',
            config = load_config('autopairs'),
        })

        use({
            'neovim/nvim-lspconfig',
            config = load_config('lsp'),
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
            config = load_config('vsnip'),
        })

        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = load_config('treesitter'),
        })

        use({
            'nvim-telescope/telescope.nvim',
            requires = {
                { 'nvim-lua/popup.nvim' },
                { 'nvim-lua/plenary.nvim' },
                { 'kyazdani42/nvim-web-devicons' },
            },
            config = load_config('telescope'),
            cmd = 'Telescope',
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
            prompt_border = 'single',
        },
    },
})
