local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print "[PlugErr] telescope not loaded"
	return
end

-- import form base telescope
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")
-- file-browser
local fb_actions = require "telescope._extensions.file_browser.actions"

-- Change *data source* to be the selected dir, and then do grep action on the selected dir
local ts_select_dir_for_grep = function(prompt_bufnr)
	local fb = telescope.extensions.file_browser
	local live_grep = builtin.live_grep
	local current_line = action_state.get_current_line()
	fb.file_browser({
		files = false,
		depth = false,
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local entry_path = action_state.get_selected_entry().Path
				local dir = entry_path:is_dir() and entry_path or entry_path:parent()
				local relative = dir:make_relative(vim.fn.getcwd())
				local absolute = dir:absolute()
				live_grep({
					results_title = relative .. "/",
					cwd = absolute,
					default_text = current_line,
				})
			end)
			return true
		end,
	})
end

telescope.setup {
	-- PICKER: what is the data source
	pickers = {
		live_grep = {
			mappings = {
				i = {
					["<C-f>"] = ts_select_dir_for_grep,
				},
				n = {
					["<C-f>"] = ts_select_dir_for_grep,
				},
			},
		},
	},
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				-- navigation
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-l>"] = actions.select_default,
				-- preview movements
				["<Up>"] = actions.preview_scrolling_up,
				["<Down>"] = actions.preview_scrolling_down,
				-- preview movements with ctrl
				["<C-Up>"] = actions.preview_scrolling_up,
				["<C-Down>"] = actions.preview_scrolling_down,
				-- close actions
				["<leader>ff"] = actions.close,
				["<leader>fg"] = actions.close,
				["<leader>fc"] = actions.close,
				["<leader>fb"] = actions.close,
				["<leader>fr"] = actions.close,
				["<leader>fh"] = actions.close,
				["<leader>fm"] = actions.close,
				-- selected actions
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
			},
			n = {
				["<n>"] = actions.cycle_history_next,
				["<p>"] = actions.cycle_history_prev,
				-- navigation
				["<j>"] = actions.move_selection_next,
				["<k>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				-- preview movements
				["<Up>"] = actions.preview_scrolling_up,
				["<Down>"] = actions.preview_scrolling_down,
				-- close actions
				["<leader>ff"] = actions.close,
				["<leader>fg"] = actions.close,
				["<leader>fc"] = actions.close,
				["<leader>fb"] = actions.close,
				["<leader>fr"] = actions.close,
				["<leader>fh"] = actions.close,
				["<leader>fm"] = actions.close,
				-- selected actions
				["<x>"] = actions.select_horizontal,
				["<v>"] = actions.select_vertical,
				["<t>"] = actions.select_tab,
				["<q>"] = actions.send_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,                -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",    -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			-- path
			-- cwd
			cwd_to_path = true,
			grouped = true,
			files = true,
			add_dirs = true,
			depth = 1,
			auto_depth = true,
			select_buffer = true,
			hidden = { file_browser = false, folder_browser = false },
			-- respect_gitignore
			-- browse_files
			-- browse_folders
			hide_parent_dir = false,
			collapse_dirs = true,
			prompt_path = false,
			quiet = false,
			dir_icon = "",
			dir_icon_hl = "Default",
			display_stat = { date = true, size = true, mode = true },
			hijack_netrw = false,
			use_fd = true,
			git_status = true,
			mappings = {
				["i"] = {
					["<C-c>"] = fb_actions.create,
					["<S-CR>"] = fb_actions.create_from_prompt,
					["<C-r>"] = fb_actions.rename,
					["<C-m>"] = fb_actions.move,
					["<C-y>"] = fb_actions.copy,
					["<C-d>"] = fb_actions.remove,
					["<C-o>"] = fb_actions.open,
					["<C-g>"] = fb_actions.goto_parent_dir,
					--["<C-e>"] = fb_actions.goto_home_dir, --NOT WORKING
					["<C-w>"] = fb_actions.goto_cwd,
					--["<C-t>"] = fb_actions.change_cwd,
					["<C-t>"] = actions.select_tab,
					["<C-f>"] = fb_actions.toggle_browser,
					["<C-.>"] = fb_actions.toggle_hidden,
					["<C-s>"] = fb_actions.toggle_all,
					["<bs>"] = fb_actions.backspace,
					["<C-h>"] = fb_actions.backspace,
					-- <C-?> FOR HELP
				},
				["n"] = {
					["c"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["y"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["g"] = fb_actions.goto_parent_dir,
					--["e"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					--["t"] = fb_actions.change_cwd,
					["t"] = actions.select_tab,
					["f"] = fb_actions.toggle_browser, -- show only folders
					["."] = fb_actions.toggle_hidden,
					["s"] = fb_actions.toggle_all,
					["<bs>"] = fb_actions.backspace,
					["h"] = fb_actions.backspace,
					-- ? FOR HELP
				},
			},
		},
	},
}
-- LAOD EXTENSIONS [
telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
telescope.load_extension 'neoclip'
telescope.load_extension 'git_diffs'
-- ]
-- CLIPBOARD HISTORY [
require('neoclip').setup({
	history = 1000,
	enable_persistent_history = false,
	length_limit = 1048576,
	continuous_sync = false,
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
	filter = nil,
	preview = true,
	prompt = nil,
	default_register = '"',
	default_register_macros = 'q',
	enable_macro_history = true,
	content_spec_column = false,
	disable_keycodes_parsing = false,
	on_select = {
		move_to_front = false,
		close_telescope = true,
	},
	on_paste = {
		set_reg = false,
		move_to_front = false,
		close_telescope = true,
	},
	on_replay = {
		set_reg = false,
		move_to_front = false,
		close_telescope = true,
	},
	on_custom_action = {
		close_telescope = true,
	},
	keys = {
		telescope = {
			i = {
				select = '<cr>',
				paste = '<c-p>',
				paste_behind = '<c-b>',
				replay = '<c-q>', -- replay a macro
				delete = '<c-d>', -- delete an entry
				edit = '<c-e>', -- edit an entry
				custom = {},
			},
			n = {
				select = '<cr>',
				paste = 'p',
				--- It is possible to map to more than one key.
				-- paste = { 'p', '<c-p>' },
				paste_behind = 'b',
				replay = 'q',
				delete = 'd',
				edit = 'e',
				custom = {},
			},
		},
		fzf = {
			select = 'default',
			paste = 'ctrl-p',
			paste_behind = 'ctrl-k',
			custom = {},
		},
	},
})
-- ]
-- SEARCH TABS; SHOW FULL PATH [
require("telescope-tabs").setup({
	entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
		local entry_string = table.concat(vim.tbl_map(function(v)
			return vim.fn.fnamemodify(v, ":.")
		end, file_paths), ', ')
		return string.format('%d: %s%s', tab_id, entry_string, is_current and ' <' or '')
	end
})
-- ]
