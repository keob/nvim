require('keymap.config')
local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args

local plug_map = {
    -- complete
    ["i|<TAB>"]      = map_cmd('v:lua.tab_complete()'):with_expr():with_silent(),
    ["i|<S-TAB>"]    = map_cmd('v:lua.s_tab_complete()'):with_expr():with_silent(),
    ["s|<TAB>"]      = map_cmd('v:lua.tab_complete()'):with_expr():with_silent(),
    ["s|<S-TAB>"]    = map_cmd('v:lua.s_tab_complete()'):with_expr():with_silent(),
    ["i|<C-e>"]      = map_cmd([[compe#close('<C-e>')]]):with_expr():with_silent(),
    ["i|<CR>"]       = map_cmd([[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]]):with_noremap():with_expr():with_nowait(),

    -- lspconfig
    ["n|<leader>ll"]  = map_cr('call v:lua.open_lsp_log()'):with_noremap():with_silent():with_nowait(),
    ["n|<leader>lr"]  = map_cr('call v:lua.reload_lsp()'):with_noremap():with_silent():with_nowait(),
    ["n|<leader>rn"]  = map_cr('lua vim.lsp.buf.rename()'):with_noremap():with_silent(),
    ["n|<leader>n"]   = map_cr('lua vim.lsp.diagnostic.goto_next()'):with_noremap():with_silent(),
    ["n|<leader>m"]   = map_cr('lua vim.lsp.diagnostic.goto_prev()'):with_noremap():with_silent(),
    ["n|<leader>q"]   = map_cr('lua vim.lsp.diagnostic.set_loclist()'):with_noremap():with_silent(),
    ["n|<leader>e"]   = map_cr('lua vim.lsp.diagnostic.show_line_diagnostics()'):with_noremap():with_silent(),
    ["n|K"]           = map_cr('lua vim.lsp.buf.hover()'):with_noremap():with_silent(),
    ["n|ga"]          = map_cr('lua vim.lsp.buf.code_action()'):with_noremap():with_silent(),
    ["n|gd"]          = map_cr('lua vim.lsp.buf.definition()'):with_noremap():with_silent(),
    ["n|gt"]          = map_cr('lua vim.lsp.buf.type_definition()'):with_noremap():with_silent(),
    ["n|gr"]          = map_cr('lua vim.lsp.buf.references()'):with_noremap():with_silent(),
    ["n|g0"]          = map_cr('lua vim.lsp.buf.document_symbol()'):with_noremap():with_silent(),
    ["n|gw"]          = map_cr('lua vim.lsp.buf.workspace_symbol()'):with_noremap():with_silent(),
    ["n|gD"]          = map_cr('lua vim.lsp.buf.declaration()'):with_noremap():with_silent(),
    ["n|gi"]          = map_cr('lua vim.lsp.buf.implementation()'):with_noremap():with_silent(),
    ["n|gs"]          = map_cr('lua vim.lsp.buf.signature_help()'):with_noremap():with_silent(),

    -- Telescope
    ["n|<leader>bb"] = map_cr('Telescope buffers'):with_silent():with_noremap(),
    ["n|<leader>fh"] = map_cr('Telescope help_tags'):with_silent():with_noremap(),
    ["n|<leader>fg"] = map_cr('Telescope live_grep'):with_silent():with_noremap(),
    ["n|<Leader>fc"] = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>fl"] = map_cu('Telescope loclist'):with_noremap():with_silent(),
    ["n|<leader>fs"] = map_cr('Telescope find_files hidden=true'):with_silent():with_noremap(),
    ["n|<leader>fb"] = map_cr('Telescope file_browser'):with_silent():with_noremap(),

    -- Packer
    ["n|<leader>pi"] = map_cr('PackerInstall'):with_noremap(),
    ["n|<leader>pu"] = map_cr('PackerUpdate'):with_noremap(),
    ["n|<leader>pc"] = map_cr('PackerCompile'):with_noremap(),
};

local nvim_map = {
    ["n|<leader><leader>q"] = map_cr('q!'):with_silent():with_noremap(),
    ["n|<leader><cr>"]      = map_cr('nohl'):with_silent():with_noremap(),
    ["n|<leader>w"]         = map_cr('w'):with_silent():with_noremap(),
    ["n|<leader>sa"]        = map_cmd('ggVG'):with_silent():with_noremap(),
    ["n|<leader>se"]        = map_cmd('VG'):with_silent():with_noremap(),
    ["n|<leader>sh"]        = map_cmd('Vgg'):with_silent():with_noremap(),

    ["n|<leader>tc"] = map_cr('tabclose'):with_silent():with_noremap(),
    ["n|<leader>th"] = map_cr('tabfirst'):with_silent():with_noremap(),
    ["n|<leader>tl"] = map_cr('tablast'):with_silent():with_noremap(),
    ["n|<leader>tn"] = map_cr('tabnext'):with_silent():with_noremap(),
    ["n|<leader>tp"] = map_cr('tabprev'):with_silent():with_noremap(),
    ["n|<leader>tm"] = map_cr('tabm'):with_silent():with_noremap(),

    ["n|<leader>bn"] = map_cr('bnext'):with_silent():with_noremap(),
    ["n|<leader>bp"] = map_cr('bp'):with_silent():with_noremap(),
    ["n|<leader>bd"] = map_cr('bd'):with_silent():with_noremap(),

    ["n|<C-j>"] = map_cmd('<C-W>j'):with_silent():with_noremap(),
    ["n|<C-k>"] = map_cmd('<C-W>k'):with_silent():with_noremap(),
    ["n|<C-h>"] = map_cmd('<C-W>h'):with_silent():with_noremap(),
    ["n|<C-l>"] = map_cmd('<C-W>l'):with_silent():with_noremap(),

    ["t|<Esc>"] = map_cmd('<C-\\><C-n>'):with_silent():with_noremap(),
    ["t|<C-h>"] = map_cmd('<C-\\><C-N><C-w>h'):with_silent():with_noremap(),
    ["t|<C-j>"] = map_cmd('<C-\\><C-N><C-w>j'):with_silent():with_noremap(),
    ["t|<C-k>"] = map_cmd('<C-\\><C-N><C-w>k'):with_silent():with_noremap(),
    ["t|<C-l>"] = map_cmd('<C-\\><C-N><C-w>l'):with_silent():with_noremap(),
};

bind.nvim_load_mapping(plug_map)
bind.nvim_load_mapping(nvim_map)
