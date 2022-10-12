function map(mode, keys, command, opt)
    local options = { noremap = true, silent = true }

    if opt then
        options = vim.tbl_extend('force', options, opt)
    end

    vim.keymap.set(mode, keys, command, options)
end

-- Leader
vim.g.mapleader = ' '
map('n', ' ', '')
map('v', ' ', '')

-- LSP
map('n', 'K', vim.lsp.buf.hover)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.references)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'ga', vim.lsp.buf.code_action)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', 'gt', vim.lsp.buf.type_definition)
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>gm', vim.diagnostic.goto_prev)
map('n', '<leader>gn', vim.diagnostic.goto_next)
map('n', '<leader>gl', vim.diagnostic.setloclist)
map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '<leader>ls', vim.lsp.buf.signature_help)
map('n', '<leader>sd', vim.lsp.buf.document_symbol)
map('n', '<leader>sw', vim.lsp.buf.workspace_symbol)
map('n', '<leader>aw', vim.lsp.buf.add_workspace_folder)
map('n', '<leader>rw', vim.lsp.buf.remove_workspace_folder)
map('n', '<leader>fm', function()
    vim.lsp.buf.format({ async = true })
end)
map('n', '<leader>lw', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)

-- Telescope
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fl', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fs', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fgs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>fgc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>fgb', '<cmd>Telescope git_branches<cr>')

-- Packer
map('n', '<leader>pu', '<cmd>PackerUpdate<cr>')
map('n', '<leader>pc', '<cmd>PackerCompile<cr>')
map('n', '<leader>pi', '<cmd>PackerInstall<cr>')

-- Save Quit
map('n', '<leader>w', '<cmd>w<cr>')
map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>x', '<cmd>wqa<cr>')
map('n', '<leader><leader>q', '<cmd>q!<cr>')

-- Select
map('n', '<leader>se', 'VG')
map('n', '<leader>sh', 'Vgg')
map('n', '<leader>sa', 'ggVG')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Tab navigation
map('n', '<leader>tn', '<cmd>tabn<cr>')
map('n', '<leader>tp', '<cmd>tabp<cr>')
map('n', '<leader>tl', '<cmd>tablast<cr>')
map('n', '<leader>tf', '<cmd>tabfirst<cr>')
map('n', '<leader>tc', '<cmd>tabclose<cr>')

-- Buffer navigation
map('n', '<leader>bn', '<cmd>bn<cr>')
map('n', '<leader>bp', '<cmd>bp<cr>')
map('n', '<leader>bd', '<cmd>bd<cr>')

-- Increment Decrement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Split window
map('n', '<leader>ss', '<cmd>split<cr>')
map('n', '<leader>sv', '<cmd>vsplit<cr>')

-- Resize window
map('n', '<M-Up>', '<cmd>res +2<cr>')
map('n', '<M-Down>', '<cmd>res -2<cr>')
map('n', '<M-Left>', '<cmd>vertical resize-2<cr>')
map('n', '<M-Right>', '<cmd>vertical resize+2<cr>')

-- Window navigation
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')

-- Move line
map('n', '<M-j>', '<cmd>m .+1<cr>')
map('n', '<M-k>', '<cmd>m .-2<cr>')

-- Move block
map('v', '<M-j>', "<cmd>m '>+1<cr>gv")
map('v', '<M-k>', "<cmd>m '<-2<cr>gv")

-- Terminal navigation
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<C-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-l>', '<C-\\><C-N><C-w>l')