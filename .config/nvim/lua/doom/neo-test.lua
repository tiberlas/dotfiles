local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- SPECIFIC
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-python"
	}
}


function M.config()
	require 'neotest'.setup({
		adapters = {
			require("neotest-python"),
			require("neotest-plenary"),
		}
	})
end

return M
