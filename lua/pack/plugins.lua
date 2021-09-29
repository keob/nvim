local conf = require('pack.config')

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim' }

    use { 'tyru/caw.vim' }
    use { 'tpope/vim-surround' }

    use {
        'Raimondi/delimitMate',
        config = conf.delimimate,
        event = 'InsertEnter'
    }

    use {
        'neovim/nvim-lspconfig',
        config = conf.nvim_lsp,
        event = 'BufReadPre',
    }

    use {
        'hrsh7th/nvim-compe',
        config = conf.nvim_compe,
        event = 'InsertEnter',
    }

    use {
        'hrsh7th/vim-vsnip',
        requires = {'hrsh7th/vim-vsnip-integ'},
        config = conf.vim_vsnip,
        event = 'InsertCharPre'
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        after = 'telescope.nvim',
        config = conf.treesitter,
        event = "BufRead",
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'kyazdani42/nvim-web-devicons'}
        },
        config = conf.telescope,
        cmd = 'Telescope',
    }
end)
