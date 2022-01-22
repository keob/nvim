local bind = require("keymap.bind")
local nmap = bind.nmap
local vmap = bind.vmap
local tmap = bind.tmap

-- Leader
vim.g.mapleader = " "
nmap(" ", "")
vmap(" ", "")

-- LSP
nmap("K", ":lua vim.lsp.buf.hover()<CR>")
nmap("gd", ":lua vim.lsp.buf.definition()<CR>")
nmap("gr", ":lua vim.lsp.buf.references()<CR>")
nmap("gD", ":lua vim.lsp.buf.declaration()<CR>")
nmap("ga", ":lua vim.lsp.buf.code_action()<CR>")
nmap("gi", ":lua vim.lsp.buf.implementation()<CR>")
nmap("gs", ":lua vim.lsp.buf.signature_help()<CR>")
nmap("gt", ":lua vim.lsp.buf.type_definition()<CR>")
nmap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
nmap("<leader>ff", ":lua vim.lsp.buf.formatting()<CR>")
nmap("<leader>m", ":lua vim.diagnostic.goto_prev()<CR>")
nmap("<leader>n", ":lua vim.diagnostic.goto_next()<CR>")
nmap("<leader>q", ":lua vim.diagnostic.setloclist()<CR>")
nmap("<leader>e", ":lua vim.diagnostic.open_float()<CR>")
nmap("<leader>ld", ":lua vim.lsp.buf.document_symbol()<CR>")
nmap("<leader>lw", ":lua vim.lsp.buf.workspace_symbol()<CR>")

-- Telescope
nmap("<leader>fgs", ":Telescope git_status<CR>")
nmap("<leader>fgc", ":Telescope git_commits<CR>")
nmap("<leader>fgb", ":Telescope git_branches<CR>")
nmap("<leader>bb", ":Telescope buffers<CR>")
nmap("<leader>fh", ":Telescope help_tags<CR>")
nmap("<leader>fl", ":Telescope live_grep<CR>")
nmap("<leader>fs", ":Telescope find_files hidden=true<CR>")

-- Packer
nmap("<leader>pi", ":PackerInstall<CR>")
nmap("<leader>pu", ":PackerUpdate<CR>")
nmap("<leader>pc", ":PackerCompile<CR>")

-- Save Quit
nmap("<leader>w", ":w<CR>")
nmap("<leader><leader>q", ":q!<CR>")
nmap("<leader>x", ":wqa<CR>")

-- Select
nmap("<leader>sa", "ggVG")
nmap("<leader>se", "VG")
nmap("<leader>sh", "Vgg")

-- Tab
nmap("<leader>tc", ":tabclose<CR>")
nmap("<leader>tf", ":tabfirst<CR>")
nmap("<leader>tl", ":tablast<CR>")
nmap("<leader>tn", ":tabn<CR>")
nmap("<leader>tp", ":tabp<CR>")

-- Buffer
nmap("<leader>bn", ":bn<CR>")
nmap("<leader>bp", ":bp<CR>")
nmap("<leader>bd", ":bd<CR>")

-- Increment Decrement
nmap("+", "<C-a>")
nmap("-", "<C-x>")

-- Split window
nmap("<leader>ss", ":split<CR>")
nmap("<leader>sv", ":vsplit<CR>")

-- Resize window
nmap("<M-Up>", ":res +2<CR>")
nmap("<M-Down>", ":res -2<CR>")
nmap("<M-Left>", ":vertical resize-2<CR>")
nmap("<M-Right>", ":vertical resize+2<CR>")

-- Move window
nmap("<C-j>", "<C-W>j")
nmap("<C-k>", "<C-W>k")
nmap("<C-h>", "<C-W>h")
nmap("<C-l>", "<C-W>l")

-- Move line
nmap("<M-j>", ":m .+1<CR>")
nmap("<M-k>", ":m .-2<CR>")

-- Move block
vmap("<M-j>", ":m '>+1<CR>gv")
vmap("<M-k>", ":m '<-2<CR>gv")

-- Terminal
tmap("<Esc>", "<C-\\><C-n>")
tmap("<C-j>", "<C-\\><C-N><C-w>j")
tmap("<C-k>", "<C-\\><C-N><C-w>k")
tmap("<C-h>", "<C-\\><C-N><C-w>h")
tmap("<C-l>", "<C-\\><C-N><C-w>l")
