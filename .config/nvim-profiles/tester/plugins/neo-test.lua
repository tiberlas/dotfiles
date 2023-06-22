local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	print "[PlugErr] neotest not loaded"
	return
end

neotest.setup({
	adapters = {
		--require("neotest-plenary"),
		require('neotest-jest')({
			jestCommand = "jest --runInBand",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
	}
})

vim.keymap.set('n', '<leader>TT', function() neotest.run.run() end) -- run nearest test
vim.keymap.set('n', '<leader>TF',
	function()
		neotest.run.run(vim.fn.expand("%"))
	end) -- run all tests in the current buffer
vim.keymap.set('n', '<leader>TS', function() neotest.run.stop() end)
vim.keymap.set('n', '<leader>TA', function() neotest.run.attach() end)
vim.keymap.set('n', '<leader>To', function() neotest.output_panel.toggle() end) -- terminal with test logs
vim.keymap.set('n', '<leader>Ts', function() neotest.summary.toggle() end) -- test tree with status of test
vim.keymap.set('n', '<leader>Tj', function() neotest.jump.prev({ status = "failed" }) end)
vim.keymap.set('n', '<leader>Tk', function() neotest.jump.next({ status = "failed" }) end)

vim.keymap.set('n', '<leader>TD', function() neotest.run.run({strategy = "dap", adapter = "node2"}) end)
