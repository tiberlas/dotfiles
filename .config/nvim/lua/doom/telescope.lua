local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{
			"nvim-telescope/telescope-file-browser.nvim",
			dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		},
		{ "LukasPietzschmann/telescope-tabs" },
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.0.0",
		},
		{ "mollerhoj/telescope-recent-files.nvim" },
		{ "nvim-telescope/telescope-symbols.nvim" },
		{
			"AckslD/nvim-neoclip.lua",
			dependencies = {
				{ "kkharji/sqlite.lua", module = "sqlite" },
			},
		},
	},
}

-- GIT MV
local function is_git_repo()
	vim.fn.system("git rev-parse --is-inside-work-tree")
	return vim.v.shell_error == 0
end
local get_target_dir = function(finder)
	local entry_path
	if finder.files == false then
		local entry = action_state.get_selected_entry()
		entry_path = entry and entry.value -- absolute path
	end
	return finder.files and finder.path or entry_path
end
local git_move = function(prompt_bufnr)
	if is_git_repo() then
		print("Prompt_bufnr: " .. prompt_bufnr)
		local fb_utils = require("telescope._extensions.file_browser.utils")
		local selections = fb_utils.get_selected_files(prompt_bufnr, false)
		if vim.tbl_isempty(selections) then
			print("NOTHING SELECTED")
			return
		end
		local current_picker = action_state.get_current_picker(prompt_bufnr)
		local target_dir = get_target_dir(current_picker.finder)
		local Path = require("plenary.path")
		for _, selection in ipairs(selections) do
			local filename = selection.filename:sub(#selection:parent().filename + 2)
			local new_path = Path:new({ target_dir, filename })
			local git_cmd = "git mv " .. tostring(selection) .. " " .. tostring(new_path)
			vim.fn.system(git_cmd)
		end
	else
		fb_actions.move(prompt_bufnr)
	end
end

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

function M.config()
	local icons = require("doom.icons")
	local actions = require("telescope.actions")
	local telescope = require("telescope")

	-- file-browser
	local fb_actions = require("telescope._extensions.file_browser.actions")

	local display_full_path_name = function(opts, path)
		--[[
		-- Displays path as: `FILE_NAME (FULL_ROOT_PATH)`
		-- use this fun in *path_display* config
		--]]
		local tail = require("telescope.utils").path_tail(path)
		return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
	end

	telescope.setup({
		defaults = {
			theme = "ivy",
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

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
		pickers = {
			live_grep = {
				theme = "ivy",
				mappings = {
					i = {
						["<C-f>"] = ts_select_dir_for_grep,
					},
					n = {
						["<C-f>"] = ts_select_dir_for_grep,
					},
				},
			},

			git_branches = {
				theme = "ivy",
			},

			git_status = {
				theme = "ivy",
				path_display = display_full_path_name,
			},

			git_stash = {
				theme = "ivy",
			},

			command_history = {
				theme = "ivy",
			},

			recent_files = {
				theme = "ivy",
				path_display = display_full_path_name,
			},

			live_grep_args = {
				theme = "ivy",
			},

			git_commits = {
				theme = "ivy",
			},

			grep_string = {
				theme = "ivy",
			},

			find_files = {
				theme = "ivy",
			},

			oldfiles = {
				theme = "ivy",
			},

			quickfix = {
				theme = "ivy",
			},

			diagnostics = {
				theme = "ivy",
			},

			spell_suggest = {
				theme = "ivy",
			},

			help_tags = {
				theme = "ivy",
			},

			buffers = {
				theme = "ivy",
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				theme = "ivy",
				show_pluto = true,
				show_moon = true,
			},

			lsp_type_definitions = {
				theme = "ivy",
			},

			lsp_document_symbols = {
				theme = "ivy",
			},

			lsp_declaration = {
				theme = "ivy",
				initial_mode = "normal",
			},

			lsp_references = {
				theme = "ivy",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "ivy",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "ivy",
				initial_mode = "normal",
			},

			lsp_implementations = {
				theme = "ivy",
				initial_mode = "normal",
			},
		},
		extensions = {
			live_grep_args = {
				auto_quoting = true,
				theme = "ivy"
			},

			file_browser = {
				theme = "ivy",
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
						["<C-a>"] = fb_actions.rename,
						["<C-m>"] = git_move,
						["<C-y>"] = fb_actions.copy,
						["<C-d>"] = fb_actions.remove,
						["<C-o>"] = fb_actions.open,
						["<C-g>"] = fb_actions.goto_parent_dir,
						["<C-e>"] = fb_actions.goto_home_dir,
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
						["m"] = git_move,
						["y"] = fb_actions.copy,
						["d"] = fb_actions.remove,
						["o"] = fb_actions.open,
						["g"] = fb_actions.goto_parent_dir,
						["e"] = fb_actions.goto_home_dir,
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
	})

	require("neoclip").setup({
		history = 1000,
		enable_persistent_history = false,
		length_limit = 1048576,
		continuous_sync = false,
		db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
		filter = nil,
		preview = true,
		prompt = nil,
		default_register = '"',
		default_register_macros = "q",
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
					select = "<cr>",
					paste = "<c-p>",
					paste_behind = "<c-k>",
					replay = "<c-q>", -- replay a macro
					delete = "<c-d>", -- delete an entry
					edit = "<c-e>", -- edit an entry
					custom = {},
				},
				n = {
					select = "<cr>",
					paste = "p",
					--- It is possible to map to more than one key.
					-- paste = { 'p', '<c-p>' },
					paste_behind = "P",
					replay = "q",
					delete = "d",
					edit = "e",
					custom = {},
				},
			},
		},
	})

	telescope.load_extension("live_grep_args")
	telescope.load_extension("recent-files")
end

return M
