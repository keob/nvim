local map = require('keymap.bind').map

-- Leader
vim.g.mapleader = ' '
map('n', ' ', '')
map('v', ' ', '')

-- LSP
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>fm', ':lua vim.lsp.buf.formatting()<CR>')
map('n', '<leader>m', ':lua vim.diagnostic.goto_prev()<CR>')
map('n', '<leader>n', ':lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>q', ':lua vim.diagnostic.setloclist()<CR>')
map('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>')
map('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>ld', ':lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<leader>lw', ':lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', '<leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<leader>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<leader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

-- Telescope
map('n', '<leader>fgs', ':Telescope git_status<CR>')
map('n', '<leader>fgc', ':Telescope git_commits<CR>')
map('n', '<leader>fgb', ':Telescope git_branches<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>fl', ':Telescope live_grep<CR>')
map('n', '<leader>fs', ':Telescope find_files<CR>')

-- Packer
map('n', '<leader>pi', ':PackerInstall<CR>')
map('n', '<leader>pu', ':PackerUpdate<CR>')
map('n', '<leader>pc', ':PackerCompile<CR>')

-- Save Quit
map('n', '<leader>w', ':w<CR>')
map('n', '<leader><leader>q', ':q!<CR>')
map('n', '<leader>x', ':wqa<CR>')

-- Select
map('n', '<leader>sa', 'ggVG')
map('n', '<leader>se', 'VG')
map('n', '<leader>sh', 'Vgg')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Tab navigation
map('n', '<leader>tc', ':tabclose<CR>')
map('n', '<leader>tf', ':tabfirst<CR>')
map('n', '<leader>tl', ':tablast<CR>')
map('n', '<leader>tn', ':tabn<CR>')
map('n', '<leader>tp', ':tabp<CR>')

-- Buffer navigation
map('n', '<leader>bn', ':bn<CR>')
map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>bd', ':bd<CR>')

-- Increment Decrement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Split window
map('n', '<leader>ss', ':split<CR>')
map('n', '<leader>sv', ':vsplit<CR>')

-- Resize window
map('n', '<M-Up>', ':res +2<CR>')
map('n', '<M-Down>', ':res -2<CR>')
map('n', '<M-Left>', ':vertical resize-2<CR>')
map('n', '<M-Right>', ':vertical resize+2<CR>')

-- Window navigation
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')

-- Move line
map('n', '<M-j>', ':m .+1<CR>')
map('n', '<M-k>', ':m .-2<CR>')

-- Move block
map('v', '<M-j>', ":m '>+1<CR>gv")
map('v', '<M-k>', ":m '<-2<CR>gv")

-- Terminal navigation
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<C-j>', '<C-\\><C-N><C-w>j')
map('t', '<C-k>', '<C-\\><C-N><C-w>k')
map('t', '<C-h>', '<C-\\><C-N><C-w>h')
map('t', '<C-l>', '<C-\\><C-N><C-w>l')
