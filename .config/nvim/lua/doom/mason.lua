-- ensures that language servers are installed if not then it installs it
-- just installs the binaries, doesn't configure it
-- the bins lives in `~/.local/share/nvim/mason/bin/`

local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
}

function M.config()
	require("mason").setup({})
	local servers = require("doom.servers")

	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls",
			"cssls",
			"html",
			"tsserver",
			"eslint",
			"pyright",
			"pylsp",
			"bashls",
			"jsonls",
			"yamlls",
			"marksman",
			"lemminx",
			"openscad_lsp",
		},
	})
end

return M
