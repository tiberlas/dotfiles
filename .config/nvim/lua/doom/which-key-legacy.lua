local M = {
	"folke/which-key.nvim",
}

function M.config()
	local leader_normal_mappings = {
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
		r = { "<cmd>LspRestart<cr><cmd>Gitsigns refresh<cr>", "Refresh" },
		T = {
			name = "Tab",
			t = { "<cmd>tabnew %<cr>", "Mv Buff To Tab" },
			o = { "<cmd>tabonly<cr>", "Only" },
			n = { "<cmd>tabnew<cr>", "New" },
			c = { "<cmd>tabclose<cr>", "Close" },
			h = { "<cmd>-tabmove<cr>", "Move Left" },
			l = { "<cmd>+tabmove<cr>", "Move Right" },
		},
		g = {
			name = "Git",
			B = { "<cmd>Telescope git_branches<cr>", "Branches" },
			c = { "<cmd>Telescope git_commits<cr>", "Commits" },
			s = { "<cmd>Telescope git_status<cr>", "Status" },
			S = { "<cmd>Telescope git_stash<cr>", "Stash" },
			j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
			k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
			r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
			R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
			u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Stage Hunk" },
			a = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
			A = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
			b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
			p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview" },
			d = { "<cmd>Gitsigns diffthis<cr>", "Diff Changes" },
			f = { "<cmd>DiffviewFileHistory %<cr>", "FileHistory" },
			h = { "<cmd>DiffviewFileHistory<cr>", "Commits Diff" },
			l = { "<cmd>DiffviewOpen HEAD^<cr>", "Latest Commit Or Stage Diff" },
			t = {
				name = "Git Diff Tool",
				t = { "<cmd>DiffviewToggleFiles<cr>", "Toogle Files View" },
				r = { "<cmd>DiffviewRefresh<cr>", "Refresh View" },
				c = { "<cmd>DiffviewClose<cr>", "Close View" },
			},
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
			g = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Grep" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			r = { "<cmd>lua require('telescope').extensions['recent-files'].recent_files({})<cr>", "Recently Open Files" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
			m = { "<cmd>Telescope command_history<cr>", "Command History" },
			q = { "<cmd>Telescope quickfix<cr>", "Quickfix" }, --populate the list with grep
			s = { "<cmd>Telescope spell_suggest<cr>", "Spell" },
			c = { "<cmd>Telescope neoclip theme=ivy<cr>", "Clipboard" },
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
		l = {
			name = "LSP",
			j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Err" },
			k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Err" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Code Action" },
			t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
			r = { "<cmd>Telescope lsp_references<cr>", "Reference" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			e = { "<cmd>Telescope diagnostics<cr>", "List Errors" },
			i = { "<cmd>Telescope lsp_implementations<cr>", "Implementation" },
			d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
			D = { "<cmd>Telescope lsp_declaration<cr>", "Declaration" },
			f = { "<cmd>Format<cr>", "Format" },
		},
		d = {
			name = "DAP",
			e = { "<cmd>lua require'dapui'.eval()<cr>", "Eval" },
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
		z = { "<cmd>ZenMode<cr>", "|>ZEN"},
		o = {
			name = "Org Mode",
			a = "Agenda",
			o = "Follow URL",
			t = "Update Tags",
			i = {
				name = "Insert",
				h = "Headline",
				t = "TODO after Headline",
				T = "TODO next line",
			}
		},
		e = "Super Yank",
	}

	local leader_visual_mappings = {
		l = {
			name = "LSP",
			j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Err" },
		}
	}

	local icons = require "doom.icons"

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
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		motions = {
				count = true,
			},
			icons = {
				breadcrumb = icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
				separator = icons.ui.Tab, -- symbol used between a key and it's label
				group = icons.ui.Plus, -- symbol prepended to a group
			},
		window = {
			border = "none",
			position = "bottom",
			padding = { 2, 2, 2, 2 },
			winblend = 0,
		},
		ignore_missing = true,
		show_help = false,
		show_keys = true,
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	}

	which_key.register(leader_normal_mappings, {mode = "n", prefix = "<leader>"})
	which_key.register(leader_visual_mappings, {mode = "v", prefix = "<leader>"})
end

return M
