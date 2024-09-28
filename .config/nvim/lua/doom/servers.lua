-- LSP, DAP, Lint, Formatter servers
-- ENSURE THAT ALL SERVERS ARE INSTALLED THROUGH MASON
-- ENSURE YOU HAVE INSTALLED npm, pip and luarocks THROUGH APP STORE THAT NVIM IS INSTALLED (e.g. brew)
-- see: `https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md`

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
	"openscad_lsp",
}
M.dap = {
	{ name = "node-debug2-adapter", command = "" },
	{ name = "debugpy",             command = "" },
}
-- linters or diagnostics
M.lint = {
	-- css
	{ name = "stylelint", command = "stylelint" },
	-- javascript
	{ name = "eslint_d",  command = "eslint_d" },
	-- python
	{ name = "flake8",    command = "flake8" },
	--{ name = "pylint",  command = "pylint" },
	{ name = "ruff",      command = "ruff" },
	-- lua
	{ name = "selene",    command = "selene" },
	-- text, markdown
	{ name = "vale",      command = "vale" },
}
M.formatter = {
	-- lua
	--{ name = "luaformatter", command = "lua_format" },
	{name= "stylua", command = "stylua"},
	-- javascript
	{ name = "prettier",     command = "prettier" },
	-- python
	{ name = "autoflake",    command = "autoflake" },
	{ name = "black",        command = "black" },
	-- markdown
	{ name = "markdown-toc", command = "markdown_toc" },
	-- others
	{ name = "xmlformatter", command = "xmlformat" },
}

return M
