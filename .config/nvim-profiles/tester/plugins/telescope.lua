local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print"[PlugErr] telescope not loaded"
	return
end

local actions = require("telescope.actions")
telescope.setup {
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
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'neoclip')

