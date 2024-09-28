local M = {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}

function M.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		lua = { "selene" },
		luau = { "selene" },
		python = { "flake8", "ruff", "pylint", "mypy" },
		json = {"jsonlint"},
		yaml = { "actionlint" },
		typescript = { "ts-standard", "oxlint", "eslint_d" },
		javascript = { "oxlint", "eslint_d" },
		html = { "htmlhint" },
		css = { "stylelint" },
		sass = { "stylelint" },
		scss = { "stylelint" },
		less = { "stylelint" },
		cmake = { "cmakelang" },
		c = { "cpplint" },
		cpp = { "cpplint"},
		bash = { "shellcheck" },
		markdown = { "markdownlint", "vale" },
		latext = {"vale"},
		text = {"vale"},
	}

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})

	lint.linters.cs = require("lint.util").wrap(lint.linters.cspell, function(diagnostic)
		diagnostic.severity = vim.diagnostic.severity.HINT
		return diagnostic
	end)
	-- spell check
	lint.linters.cspell = require("lint.util").wrap(lint.linters.cspell, function(diagnostic)
		diagnostic.severity = vim.diagnostic.severity.HINT
		return diagnostic
	end)
	lint.linters.misspell = require("lint.util").wrap(lint.linters.cspell, function(diagnostic)
		diagnostic.severity = vim.diagnostic.severity.HINT
		return diagnostic
	end)
end

return M
