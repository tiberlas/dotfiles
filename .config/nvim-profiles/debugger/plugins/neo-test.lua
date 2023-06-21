require("neodev").setup({
	library = { plugins = { "neotest" }, types = true }
})

require('neotest').setup({
	adapters = {
		require('neotest-jest')({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-plenary"),
	}
})

vim.keymap.set("n", "<leader>tr", function() require('neotest').run.run() end)
vim.keymap.set("n", "<leader>tR", function() require('neotest').run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>td", function() require('neotest').run.run({strategy = "dap"}) end)
vim.keymap.set("n", "<leader>ta", function() require('neotest').run.attach() end)
