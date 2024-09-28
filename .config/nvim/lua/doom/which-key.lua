local M = {
	"folke/which-key.nvim",
}

function M.config()
	local wk = require("which-key")
	local icons = require("doom.icons")

	wk.add({
		mode = "n",
		{ "<leader>R", "<cmd>LspRestart<cr><cmd>Gitsigns refresh<cr>", desc = "Refers", icon = icons.whichkey.Refers },
		{ "<leader>e", desc = "Super Yank", icon = icons.whichkey.Yank },
		{ "<leader>z",  "<cmd>ZenMode<cr>", desc = "Zen", icon = icons.whichkey.Zen },
		{ "<leader>r", desc = "Ranger", icon = icons.whichkey.Ranger },
	})
	wk.add({
		mode = "v",
		{ "<leader>e", desc = "Super Yank", icon = icons.Ynak },
	})
	-- GROUPS
	wk.add({
		mode = "n",
		{ "<leader>a", group = "Actions", icon = icons.whichkey.Action },
		{ "<leader>t", group = "Tab", icon = icons.whichkey.Tab },
		{ "<leader>g", group = "Git", icon = icons.whichkey.Git },
		{ "<leader>gt", group = "Git Diff", icon = icons.whichkey.GitDiff },
		{ "<leader>f", group = "File | Fun", icon = icons.whichkey.File },
		{ "<leader>c", group = "Class", icon = icons.whichkey.Class },
		{ "<leader>l", group = "LSP", icon = icons.whichkey.LSP },
		{ "<leader>t", group = "Test", icon = icons.whichkey.Test },
		{ "<leader>d", group = "DAP", icon = icons.whichkey.DAP },
		{ "<leader>o", group = "Org Mode", icon = icons.whichkey.Org },
	})
	-- ACTION
	wk.add({
		mode = "n",
		{ "<leader>ad", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
		{ "<leader>as", "<cmd>lua _CONVERT_TO_SPACES()<CR>", desc = "Convert To Spaces" },
		{ "<leader>ac", "<Plug>(comment_toggle_linewise_current)", desc = "Commnet" },
		{ "<leader>at", "<cmd>lua _CONVERT_TO_TABS()<CR>", desc = "Convert To Tabs" },
		{ "<leader>ai", "<cmd>set foldmethod=indent<CR>", desc = "Indent Folds" },
		{ "<leader>am", "<cmd>set foldmethod=marker<CR>", desc = "Marker Folds ({{{)" },
		{ "<leader>az", "<cmd>set nofoldenable<CR>", desc = "Disables Folds" },
		{ "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
	})
	wk.add({
		mode = "v",
		{ "<leader>ac", "<Plug>(comment_toggle_linewise_visual)", desc = "Commnet" },
	})
	-- Tab
	wk.add({
		mode = "n",
		{ "<leader>tt", "<cmd>tabnew %<cr>", desc = "Mv Buff To Tab" },
		{ "<leader>to", "<cmd>tabonly<cr>", desc = "Only" },
		{ "<leader>tn", "<cmd>tabnew<cr>", desc = "New" },
		{ "<leader>tc", "<cmd>tabclose<cr>", desc = "Close" },
		{ "<leader>th", "<cmd>-tabmove<cr>", desc = "Move Left" },
		{ "<leader>tl", "<cmd>+tabmove<cr>", desc = "Move Right" },
	})
	-- GIT
	wk.add({
		mode = "n",
		{ "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
		{ "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
		{ "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
		{ "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
		{ "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
		{ "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Stage Hunk" },
		{ "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
		{ "<leader>gA", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Buffer" },
		{ "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff Changes" },
		{ "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "FileHistory" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Commits Diff" },
		{ "<leader>gl", "<cmd>DiffviewOpen HEAD^<cr>", desc = "Latest Commit Or Stage Diff" },
		{ "<leader>gtt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toogle Files View" },
		{ "<leader>gtr", "<cmd>DiffviewRefresh<cr>", desc = "Refers View" },
		{ "<leader>gtc", "<cmd>DiffviewClose<cr>", desc = "Close View" },
	})
	-- File
	wk.add({
		mode = "n",
		{ "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "Explorer" },
		{
			"<leader>ff",
			"<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",
			desc = "Find Files",
		},
		{ "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{
			"<leader>fr",
			"<cmd>lua require('telescope').extensions['recent-files'].recent_files({})<cr>",
			desc = "Recently Open Files",
		},
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
		{ "<leader>fm", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" }, --populate the list with grep
		{ "<leader>fs", "<cmd>Telescope spell_suggest<cr>", desc = "Spell" },
		{ "<leader>fc", "<cmd>Telescope neoclip theme=ivy<cr>", desc = "Clipboard" },
		{ "<leader>ft", "<cmd>lua require('telescope-tabs').list_tabs()<cr>", desc = "Tabs" },
		{ "<leader>fj", desc = "Jump to Next Fun" },
		{ "<leader>fJ", desc = "Jump to Next Fun End" },
		{ "<leader>fk", desc = "Jump to Prev Fun" },
		{ "<leader>fK", desc = "Jump to Prev Fun End" },
	})
	-- Class
	wk.add({
		mode = "n",
		{ "<leader>cj", desc = "Jump to Next Class" },
		{ "<leader>cJ", desc = "Jump to Next Class End" },
		{ "<leader>cj", desc = "Jump to Prev Class" },
		{ "<leader>cK", desc = "Jump to Prev Class End" },
	})
	-- LSP
	wk.add({
		mode = "n",
		{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Err" },
		{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Err" },
		{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
		{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
		{ "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Code Action" },
		{ "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definition" },
		{ "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "Reference" },
		{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
		{ "<leader>le", "<cmd>Telescope diagnostics<cr>", desc = "List Errors" },
		{ "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementation" },
		{ "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
		{ "<leader>lD", "<cmd>Telescope lsp_declaration<cr>", desc = "Declaration" },
		{ "<leader>lf", "<cmd>Format<cr>", desc = "Format" },
	})
	-- TEST
	wk.add({
		mode = "n",
		{ "<leader>tt", "<cmd>lua require'neotest'.run.run() <cr>", desc = "Run Test" },
		{ "<leader>tb", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%')) <cr>", desc = "Run All In Buffer" },
		{ "<leader>tc", "<cmd>lua require'neotest'.run.stop() <cr>", desc = "Terminate" },
		{ "<leader>tj", "<cmd>lua require'neotest'.jump.next({ status = 'failed' }) <cr>", desc = "Next Failed" },
		{ "<leader>tk", "<cmd>lua require'neotest'.jump.prev({ status = 'failed' }) <cr>", desc = "Prev Failed" },
		{ "<leader>tp", "<cmd>lua require'neotest'.output_panel.toggle() <cr>", desc = "Panel Toogle" },
		{ "<leader>ts", "<cmd>lua require'neotest'.summary.toggle() <cr>", desc = "Summary Toogle" },
		{ "<leader>td", "<cmd>lua require'neotest'.run.run({strategy = 'dap'}) <cr>", desc = "Debug" },
		{ "<leader>ta", "<cmd>lua require'neotest'.run.attach() <cr>", desc = "Attach Runner" },
	})
	-- DAP
	wk.add({
		mode = "n",
		{ "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Eval" },
		{ "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle UI" },
		{ "<leader>dp", "<cmd>lua require'dap.ui.widgets'.preview()<cr>", desc = "Preview Memory" },
		{ "<leader>dw", "<cmd>lua require'dapui'.elements.watches.add()<cr>", desc = "Watcher Add" },
		{ "<leader>dW", "<cmd>lua require'dapui'.elements.watches.remove()<cr>", desc = "Watcher Remove" },
		{ "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue/Start" },
		{ "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
		{ "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
		{ "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
		{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Breakpoint Toggle" },
		{
			"<leader>dB",
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			desc = "Breakpoint Condition",
		},
		{
			"<leader>dl",
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
			desc = "Breakpoint Log",
		},
		{ "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", desc = "Repel" },
		{ "<leader>dd", "<cmd>lua require'dap'.run_last()<cr>", desc = "Run Last" },
	})
end

return M
