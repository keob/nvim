local conf = require("pack.config")

vim.cmd("packadd packer.nvim")

return require("packer").startup(function()
    use({ "wbthomason/packer.nvim" })

    use({ "tyru/caw.vim" })
    use({ "tpope/vim-surround" })

    use({
        "neovim/nvim-lspconfig",
        config = conf.nvim_lsp,
    })

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
        },
    })

    use({
        "hrsh7th/vim-vsnip",
        config = conf.vim_vsnip,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = conf.treesitter,
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "kyazdani42/nvim-web-devicons" },
        },
        config = conf.telescope,
        cmd = "Telescope",
    })
end)
