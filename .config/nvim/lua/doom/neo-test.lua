local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- SPECIFIC
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-jest",
	},
}

function M.config()
	require("neotest").setup({
		adapters = {
			-- PYTEST
			require("neotest-python")({
				dap = {
					justMyCode = false,
					console = "integratedTerminal",
				},
				args = { "--log-level", "DEBUG" },
				runner = "pytest",
			}),
			-- JEST
			require("neotest-jest")({
				jestCommand = "npm test --",
				jestConfigFile = "custom.jest.config.ts",
				env = { CI = true },
				cwd = function(path)
					return vim.fn.getcwd()
				end,
			}),
		},
	})
end

return M
