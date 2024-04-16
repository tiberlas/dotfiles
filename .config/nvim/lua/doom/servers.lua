-- LSP, DAP, Lint, Formatter servers
-- ENSURE THAT ALL SERVERS ARE INSTALLED THROUGH MASON
-- ENSURE YOU HAVE INSTALLED npm, pip and luarocks THROUGH APP STORE THAT NVIM IS INSTALLED (e.g. brew)
-- see: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md

local M = {}

M.lsp = {
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
}
M.dap = {
	"node-debug2-adapter",
	"debugpy",
}
M.lint = {
	-- css
	"stylelint",
	-- javascript
	"eslint_d",
	-- python
	"flake8",
	"pylint",
	"ruff",
	-- lua
	"selene",
	-- text, markdown
	"vale",
	"trivy",
}
M.formatter = {
	-- lua
	"lua_format", -- mason package: luaformatter
	-- javascript
	"prettier",
	"biome",
	-- python
	--"xmlformatter",
	"autoflake",
	"black",
	-- markdown
	"markdown_toc", -- mason package: markdown-toc
}

return M
