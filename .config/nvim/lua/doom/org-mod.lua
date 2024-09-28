local M = {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = { "org" },
}

M.config = function()
	require("orgmode").setup({
		org_todo_keywords = { "TODO🏇", "HOLD🤔", "PR🍺", "|", "DONE😏", "KILL💀" },
		org_todo_keyword_faces = {
			HOLD = ":foreground blue :weight bold",
			DELEGATED = ":background #FFFFFF :slant italic :underline on",
			TODO = ":background #000000 :foreground red",
			KILL = ":background #000000 :foreground red :underline on",
		},
	})
end

return M
