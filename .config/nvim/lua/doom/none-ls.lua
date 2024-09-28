-- FORMATTER AND LINTER
-- see: `https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md`
-- specific FORMATTER or LINTER shuld be installed via mason `:Mason`
local M = {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	}
}

function M.config()
	local null_ls = require "null-ls"
	local servers = require "doom.servers"

	local formatting = null_ls.builtins.formatting; -- formatters
	local diagnostics =  null_ls.builtins.diagnostics; -- linter

	-- some predefined builtins 
	local sources = {
		null_ls.builtins.completion.spell,
	}

	-- add linters
	for _, server in pairs(servers.lint) do
		table.insert(sources, diagnostics[server['command']])
	end

	-- add formatters
	for _, server in pairs(servers.formatter) do
		table.insert(sources, formatting[server['command']])
	end

	null_ls.setup {
		debug = false,
		sources = sources

		--[[ sources = {
			formatting.stylua,
			formatting.prettier,
			-- formatting.prettier.with {
			--	 extra_filetypes = { "toml" },
			--	 -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			-- },
			-- formatting.eslint,
			formatting.black,
			diagnostics.flake8,
			null_ls.builtins.completion.spell,
		}, ]]
	}
end

return M;
