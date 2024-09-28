local M = {
	"akinsho/org-bullets.nvim",
}

M.config = function()

	local icons = require "doom.icons"

	require("org-bullets").setup({
		concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
		symbols = {
			list = icons.org.list,
			headlines = { icons.org.headline1, icons.org.headline2, icons.org.headline3, icons.org.headline4 },
			checkboxes = {
				half = { icons.ui.Fire, "OrgTSCheckboxHalfChecked" },
				done = { icons.misc.Check, "OrgDone" },
				todo = { " ", "OrgTODO" },
			},
		},
	})
end

return M
