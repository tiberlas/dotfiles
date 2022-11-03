local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print"[PlugErr] telescope not loaded"
	return
end

local ts_select_dir_for_grep = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local fb = require("telescope").extensions.file_browser
	local live_grep = require("telescope.builtin").live_grep
	local current_line = action_state.get_current_line()
	fb.file_browser({
		files = false,
		depth = false,
		hidden = { file_browser = false, folder_browser = false },
		attach_mappings = function(prompt_bufnr)
			require("telescope.actions").select_default:replace(function()
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

local actions = require("telescope.actions")
local fb_actions = require "telescope._extensions.file_browser.actions"
telescope.setup {
	pickers = {
		live_grep = {
			additional_args = function(opts)
                return {"--hidden"}
            end,
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
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<leader>ff"] = actions.close,
				["<leader>fg"] = actions.close,
				["<leader>fc"] = actions.close,
				["<leader>fb"] = actions.close,
				["<leader>fr"] = actions.close,
				["<leader>fh"] = actions.close,
				["<leader>fm"] = actions.close,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
			},
			n = {
				["<n>"] = actions.cycle_history_next,
				["<p>"] = actions.cycle_history_prev,
				["<j>"] = actions.move_selection_next,
				["<k>"] = actions.move_selection_previous,
				["<c>"] = actions.close,
				["<leader>ff"] = actions.close,
				["<leader>fg"] = actions.close,
				["<leader>fc"] = actions.close,
				["<leader>fb"] = actions.close,
				["<leader>fr"] = actions.close,
				["<leader>fh"] = actions.close,
				["<leader>fm"] = actions.close,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<x>"] = actions.select_horizontal,
				["<v>"] = actions.select_vertical,
				["<t>"] = actions.select_tab,
				["<u>"] = actions.preview_scrolling_up,
				["<d>"] = actions.preview_scrolling_down,
				["<q>"] = actions.send_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
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
					["<A-c>"] = fb_actions.create,
					["<S-CR>"] = fb_actions.create_from_prompt,
					["<A-r>"] = fb_actions.rename,
					["<A-m>"] = fb_actions.move,
					["<A-y>"] = fb_actions.copy,
					["<A-d>"] = fb_actions.remove,
					["<C-o>"] = fb_actions.open,
					["<C-g>"] = fb_actions.goto_parent_dir,
					["<C-e>"] = fb_actions.goto_home_dir,
					["<C-w>"] = fb_actions.goto_cwd,
					["<C-t>"] = fb_actions.change_cwd,
					["<C-f>"] = fb_actions.toggle_browser,
					["<C-h>"] = fb_actions.toggle_hidden,
					["<C-s>"] = fb_actions.toggle_all,
					["<bs>"] = fb_actions.backspace,
				},
				["n"] = {
					["c"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["y"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["g"] = fb_actions.goto_parent_dir,
					["e"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					["t"] = fb_actions.change_cwd,
					["f"] = fb_actions.toggle_browser,
					["h"] = fb_actions.toggle_hidden,
					["s"] = fb_actions.toggle_all,
				},
			},
		},
	},
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'neoclip')
pcall(require('telescope').load_extension 'file_browser')

