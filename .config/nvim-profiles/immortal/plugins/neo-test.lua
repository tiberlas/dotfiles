local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	print "[PlugErr] neotest not loaded"
	return
end

neotest.setup({
	adapters = {
		require('neotest-jest')({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
	}
})

vim.keymap.set('n', '<leader>tt', function() neotest.run.run() end) -- run nearest test
vim.keymap.set('n', '<leader>tb',
	function()
		neotest.run.run(vim.fn.expand("%"))
	end) -- run all tests in the current buffer
vim.keymap.set('n', '<leader>tc', function() neotest.run.stop() end)
vim.keymap.set('n', '<leader>ta', function() neotest.run.attach() end)
vim.keymap.set('n', '<leader>tp', function() neotest.output_panel.toggle() end) -- terminal with test logs
vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end)      -- test tree with status of test
vim.keymap.set('n', '<leader>tj', function() neotest.jump.prev({ status = "failed" }) end)
vim.keymap.set('n', '<leader>tk', function() neotest.jump.next({ status = "failed" }) end)

vim.keymap.set('n', '<leader>td', function() neotest.run.run({ strategy = "dap", adapters = "node2" }) end)
