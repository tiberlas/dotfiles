local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- YOU MUST HAVE THESE TOOLS INSTALLED ON YOUR SYSTEM;
-- THIS PLUGIN JUST CALL EXTERNAL LINTING TOOLS AND IMPLEMENTS CODE FORMATING

-- for more tools see: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- for more tools see: https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier, --.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
		formatting.stylua,
		diagnostics.eslint,
		completion.spell,
		code_actions.eslint,
	},
})

