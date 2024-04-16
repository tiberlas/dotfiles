local M = {
	"folke/which-key.nvim",
}

function M.config()
	local mappings = {
		a = {
			name = "Actions",
			d = { "<cmd>nohlsearch<CR>", "No Highlight" },
			s = { "<cmd>lua _CONVERT_TO_SPACES()<CR>", "Convert To Spaces" },
			t = { "<cmd>lua _CONVERT_TO_TABS()<CR>", "Convert To Tabs" },
			i = { "<cmd>set foldmethod=indent<CR>", "Indent Folds" },
			m = { "<cmd>set foldmethod=marker<CR>", "Marker Folds ({{{)" },
			z = { "<cmd>set nofoldenable<CR>", "Disables Folds" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		},
		T = {
			name = "Tab",
			n = { "<cmd>tabnew %<cr>", "Mv Buff To Tab" },
			o = { "<cmd>tabonly<cr>", "Only" },
			h = { "<cmd>-tabmove<cr>", "Move Left" },
			l = { "<cmd>+tabmove<cr>", "Move Right" },
		},
		g = {
			name = "Git",
			B = { "<cmd>Telescope git_branches<cr>", "Branches" },
			c = { "<cmd>Telescope git_commits<cr>", "Commits" },
			s = { "<cmd>Telescope git_stash<cr>", "Stash" },
			j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
			k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
			r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
			R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
			a = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
			b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
			p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview" },
			d = { "<cmd>Gitsigns diffthis<cr>", "Diff Changes" },
			f = { "<cmd>DiffviewFileHistory %<cr>", "FileHistory" },
			h = { "<cmd>DiffviewFileHistory<cr>", "Commits Diff" },
			l = { "<cmd>DiffviewOpen HEAD^<cr>", "Latest Commit Diff" },
		},
			name = "Test",
		t = {
			t = {"<cmd>lua require'neotest'.run.run() <cr>", "Run Test"},
			b = {"<cmd>lua require'neotest'.run.run(vim.fn.expand('%')) <cr>", "Run All In Buffer"},
			c = {"<cmd>lua require'neotest'.run.stop() <cr>", "Terminate"},
			j = {"<cmd>lua require'neotest'.jump.next({ status = 'failed' }) <cr>", "Next Failed"},
			k = {"<cmd>lua require'neotest'.jump.prev({ status = 'failed' }) <cr>", "Prev Failed"},
			p = {"<cmd>lua require'neotest'.output_panel.toggle() <cr>", "Panel Toogle"},
			s = {"<cmd>lua require'neotest'.summary.toggle() <cr>", "Summary Toogle"},
			d = {"<cmd>lua require'neotest'.run.run({strategy = 'dap'}) <cr>", "Debug"},
			a = {"<cmd>lua require'neotest'.run.attach() <cr>", "Attach Runner"},
		},
		f = {
			name = "File explorer/search | Fun jump",
			e = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Explorer" },
			f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", "Find Files" },
			g = { "<cmd>Telescope live_grep<cr>", "Grep" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recently Open Files" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
			m = { "<cmd>Telescope command_history<cr>", "Command History" },
			q = { "<cmd>Telescope quickfix<cr>", "Quickfix" }, --populate the list with grep
			s = { "<cmd>Telescope spell_suggest<cr>", "Spell" },
			t = { "<cmd>lua require('telescope-tabs').list_tabs()<cr>", "Tabs" },
			j = "Jump to Next Fun",
			J = "Jump to Next Fun End",
			k = "Jump to Prev Fun",
			K = "Jump to Prev Fun End",
		},
		c = {
			name = "Class Jump",
			j = "Jump to Next Class",
			J = "Jump to Next Class End",
			k = "Jump to Prev Class",
			K = "Jump to Prev Class End",
		},
		h = {
			name = "Harpoon",
			a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
			f = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Search Files" },
		},
		l = {
			name = "LSP",
			j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Err" },
			k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Err" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
			r = { "<cmd>Telescope lsp_references<cr>", "Reference" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			h = { "<cmd>Telescope diagnostics<cr>", "Diagnostic" },
			i = { "<cmd>Telescope lsp_implementations<cr>", "Implementation" },
			d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
			f = {
				"<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
				"Format",
			},
		},
		d = {
			name = "DAP",
			u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
			p = { "<cmd>lua require'dap.ui.widgets'.preview()<cr>", "Preview Memory" },
			w = { "<cmd>lua require'dapui'.elements.watches.add()<cr>", "Watcher Add" },
			W = { "<cmd>lua require'dapui'.elements.watches.remove()<cr>", "Watcher Remove" },
			c = { "<cmd>lua require'dap'.continue()<cr>", "Continue/Start"},
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over"},
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into"},
			O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out"},
			b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint Toggle"},
			B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Breakpoint Condition"},
			l = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Breakpoint Log"},
			r = { "<cmd>lua require'dap'.repl.open()<cr>", "Repel"},
			d = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last"},
		},
		z = { "<cmd>ZenMode<cr>", "|>ZEN"}
	}

	local which_key = require "which-key"
	which_key.setup {
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		window = {
			border = "rounded",
			position = "bottom",
			padding = { 2, 2, 2, 2 },
		},
		ignore_missing = true,
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	}

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
	}

	which_key.register(mappings, opts)
end

return M
