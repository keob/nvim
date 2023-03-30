local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

treesitter.setup({
    ensure_installed = {
        'c',
        'go',
        'cpp',
        'nix',
        'zig',
        'lua',
        'vim',
        'perl',
        'rust',
        'json',
        'toml',
        'make',
        'cmake',
        'ninja',
        'proto',
        'gomod',
        'gowork',
        'python',
    },
    sync_install = true,
    indent = {
      enable = false,
    },
    highlight = {
        enable = true,
        disable = {},
    },
    incremental_selection = {
        enable = true,
    },
})
