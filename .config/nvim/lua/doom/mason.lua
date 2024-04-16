-- ensures that language servers are installed if not then it installs it
-- just installs the binaries, doesn't configure it
-- the bins lives in `~/.local/share/nvim/mason/bin/`

local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}


function M.config()
	local servers = require "doom.servers"

	require("mason").setup { }

	require("mason-lspconfig").setup {
		ensure_installed = servers.lsp,
	}
end

return M
