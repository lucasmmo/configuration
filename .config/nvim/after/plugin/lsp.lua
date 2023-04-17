local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'pylsp',
	'gopls',
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<CR>'] = cmp.mapping.confirm({ select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
	
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	sign_icons = { }
})
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false} 

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "ne", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "pe", function() vim.lsp.buf.definition() end, opts)
end)

lsp.setup()
