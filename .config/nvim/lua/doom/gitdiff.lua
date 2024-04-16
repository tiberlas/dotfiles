local M = {
	"sindrets/diffview.nvim",
}

M.config = function()
	local icons = require "doom.icons"

	require 'diffview'.setup {
		use_icons = true, -- Requires nvim-web-devicons
		icons = {      -- Only applies when use_icons is true.
			folder_closed = icons.ui.EmptyFolder,
			folder_open = icons.ui.FolderOpen,
		},
		signs = {
			fold_closed = icons.ui.BoldArrowLeft,
			fold_open = icons.ui.BoldArrowRight,
			done = "✓",
		},
	}
end

return M;
