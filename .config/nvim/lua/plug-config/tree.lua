local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print"[PlugErr] nvim-tree not loaded"
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-------------------------------------------------------------------------------
-- SET KEY MAPS
-------------------------------------------------------------------------------

KEYMAP("n", "<leader>e", ":NvimTreeToggle<cr>", OPTS)

-------------------------------------------------------------------------------
-- SETUP
-------------------------------------------------------------------------------

nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 60,
		height = 30,
		side = "left",
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},
	filesystem = {
		window = {
			mappings = {
				["h"] = function(state)
					local node = state.tree:get_node()
					if node.type == 'directory' and node:is_expanded() then
						require'neo-tree.sources.filesystem'.toggle_directory(state, node)
					else
						require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
					end
				end,
				["l"] = function(state)
					local node = state.tree:get_node()
					if node.type == 'directory' then
						if not node:is_expanded() then
							require'neo-tree.sources.filesystem'.toggle_directory(state, node)
						elseif node:has_children() then
							require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
						end
					end
				end,
			}
		}
	}
})

