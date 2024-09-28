-- configure LSP servers that are installed through mason
local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neodev.nvim",
		},
	},
}

function M.broadcast_capabilities()
	--Enable (broadcasting) snippet capability for completion
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

function M.cmp_capabilities()
	return require("cmp_nvim_lsp").default_capabilities()
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

function M.config()
	local lspconfig = require("lspconfig")
	local icons = require("doom.icons")

	local default_diagnostic_config = {
		signs = {
			active = true,
			values = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.BoldInformation },
			},
		},
		virtual_text = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			source = "always",
		},
	}
	vim.diagnostic.config(default_diagnostic_config)
	-- setup diagnostic signs
	for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- configure a specific LSP: `https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md`
	-- multy-lang
	lspconfig["ast_grep"].setup({})
	lspconfig["harper_ls"].setup({})
	-- lua
	lspconfig["lua_ls"].setup({
		on_attach = M.on_attach,
		capabilities = M.cmp_capabilities(),
	})
	-- python
	lspconfig["pyright"].setup({
		capabilities = M.cmp_capabilities(),
	})
	lspconfig["pylsp"].setup({
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 100,
					},
				},
			},
		},
	})
	lspconfig["ruff"].setup({})
	-- css
	lspconfig["cssls"].setup({
		capabilities = M.broadcast_capabilities(),
	})
	-- html
	lspconfig["html"].setup({})
	-- javascript
	lspconfig["eslint"].setup({
		capabilities = M.cmp_capabilities(),
	})
	-- typescript
	lspconfig["tsserver"].setup({
		capabilities = M.cmp_capabilities(),
	})
	-- C#
	lspconfig["omnisharp"].setup({
		capabilities = M.cmp_capabilities(),
	})
	-- openscada
	lspconfig["openscad_ls"].setup({})
	lspconfig["openscad_lsp"].setup({
		capabilities = M.cmp_capabilities(),
	})
	-- rust
	--lspconfig["bacon_ls"].setup({})
	-- r language
	lspconfig["r_language_server"].setup({
		capabilities = M.cmp_capabilities(),
	})
	-- bash
	lspconfig["bashls"].setup({})
	-- xml
	lspconfig["lemminx"].setup({})
	-- json
	lspconfig["jsonls"].setup({
		capabilities = M.broadcast_capabilities(),
	})
	-- yaml
	lspconfig["yamlls"].setup({})
	-- org md latext
	lspconfig["ltex"].setup({})
	vim.cmd([[ autocmd BufRead,BufNewFile *.org set filetype=org ]])
	lspconfig["textlsp"].setup({
		settings = {
			textLSP = {
				analysers = {
					languagetool = {
						check_text = {
							on_change = false,
							on_open = true,
							on_save = true,
						},
						enabled = true,
					},
				},
				documents = {
					org = {
						org_todo_keywords = { "TODO", "HOLD", "DONE", "KILL" },
					},
				},
			},
		},
	})
end

return M
