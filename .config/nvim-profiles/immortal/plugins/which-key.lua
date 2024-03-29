local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	print "[PlugErr] which-key not loaded"
	return
end

local setup = {
	plugins = {
		marks = true,    -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false,   -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true,    -- default bindings on <c-w>
			nav = true,        -- misc bindings to work with windows
			z = true,          -- bindings for folds, spelling and others prefixed with z
			g = true,          -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+",    -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "double",      -- none, single, double, shadow
		position = "bottom",    -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },                                            -- min and max height of the columns
		width = { min = 20, max = 50 },                                            -- min and max width of the columns
		spacing = 3,                                                               -- spacing between columns
		align = "left",                                                            -- align columns left, center or right
	},
	ignore_missing = true,                                                       -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true,                                                            -- show help message on the command line when the popup is visible
	triggers = "auto",                                                           -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",    -- NORMAL mode
	prefix = "<leader>",
	buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
	p = {
		name = "Packer and LSP installer",
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
		l = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>Mason<cr>", "LSP Installer Info" },
	},
	c = {
		name = "Comment",
		c = { "Comment Toggle" },
		O = { "Comment Above Line" },
		o = { "Comment Below Line" },
	},
	h = {
		name = "Harpoon",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
		f = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Search Files" },
	},
	f = {
		name = "File explorer/search",
		e = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Explorer" },
		f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", "Find Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recently Open Files" },
		c = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
		h = { "<cmd>Telescope help_tags<cr>", "Help" },
		m = { "<cmd>Telescope command_history<cr>", "Command History" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" }, --populate the list with grep
		s = { "<cmd>Telescope spell_suggest<cr>", "Spell" },
		t = { "<cmd>lua require('telescope-tabs').list_tabs()<cr>", "Tabs" },
		y = { "<cmd>Telescope symbols<cr>", "Symbols" },
	},
	l = {
		name = "LSP",
		j = "Next Error",
		k = "Prev Error",
		q = "Set Lock List",
		--language specific
		D = "Declaration",
		i = "Method Info",
		s = "Signature",
		a = "Action (import, ..)",
		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
		r = { "<cmd>Telescope lsp_references<cr>", "Reference" },
		S = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		h = { "<cmd>Telescope diagnostics<cr>", "Diagnostic" },
		I = { "<cmd>Telescope lsp_implementations<cr>", "Implementation" },
		d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
	},
	d = {
		name = "DAP",
		u = "Toggle UI",
		p = "Preview Memory",
		w = "Watcher Add",
		W = "Watcher Remove",
		c = "Continue/Start",
		o = "Step Over",
		i = "Step Into",
		O = "Step Out",
		b = "Breakpoint Toggle",
		B = "Breakpoint Condition",
		l = "Breakpoint Log",
		r = "Repel",
		d = "Run Last",
	},
	w = {
		name = "LSP Workspace",
		a = "Add Workspace",
		r = "Remove Workspace",
		l = "List Workspace",
	},
	g = {
		name = "Git",
		B = { "<cmd>Telescope git_branches<cr>", "Branches" },
		c = { "<cmd>Telescope git_commits<cr>", "Commits" },
		s = { "<cmd>Telescope git_stash<cr>", "Stash" },
		j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
		k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		a = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
		b = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview" },
		d = { "<cmd>Gitsigns diffthis<cr>", "Diff Changes" },
		f = { "<cmd>DiffviewFileHistory %<cr>", "FileHistory" },
		h = { "<cmd>DiffviewFileHistory<cr>", "Commits Diff" },
		H = { "<cmd>Telescope git_diffs  diff_commits<cr>", "Commits Diff BIG" },
		l = { "<cmd>DiffviewOpen HEAD^<cr>", "Latest Commit Diff" },
	},
	t = {
		name = "Test",
		t = "Run Test",
		b = "Run All In Buffer",
		c = "Terminate",
		j = "Next Failed",
		k = "Prev Failed",
		p = "Panel Toogle",
		s = "Summary Toogle",
		d = "Debug",
		a = "Attach Runner",
	},
	a = {
		name = "Code Actions",
		r = "Rename",
		f = "Format",
		d = { "<cmd>nohlsearch<CR>", "No Highlight" },
		s = { "<cmd>lua _CONVERT_TO_SPACES()<CR>", "Convert To Spaces" },
		t = { "<cmd>lua _CONVERT_TO_TABS()<CR>", "Convert To Tabs" },
		i = { "<cmd>set foldmethod=indent<CR>", "Indent Folds" },
		m = { "<cmd>set foldmethod=marker<CR>", "Marker Folds ({{{)" },
		n = { "<cmd>set nofoldenable<CR>", "Disables Folds" },
		-- tree-sitter: select
		v = { "Incremental Select" },
		u = { "Decremental Select" },
		p = { "Scope Select" },
		a = { "Swap Fun Args" },
		-- tree-sitter: jumping
		h = { "Next Class Start" },
		l = { "Prev Class Start" },
		H = { "Next Class End" },
		L = { "Prev Class End" },
	},
	-- tree-sitter: jumping
	j = { "Next Fun Start" },
	k = { "Prev Fun Start" },
	J = { "Next Fun End" },
	K = { "Prev Fun End" },
	s = {
		name = "Spell Checker",
		k = 'Prev miss-spelled',
		j = 'Next miss-spelled',
		a = 'Add Word To Valid List',
		c = 'Correct word',
	},
}

local vopts = {
	mode = "v",    -- VISUAL mode
	prefix = "<leader>",
	buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	g = {
		name = "Git",
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		a = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
	},
	c = {
		name = "Comment",
		c = { "Comment Toggle" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
