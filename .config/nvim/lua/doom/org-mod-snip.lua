local M = {
	"michaelb/sniprun",
	branch = "master",
	build = "sh install.sh",
}

function M.config()
	require("sniprun").setup({

	})
end

return M
