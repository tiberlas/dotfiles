local M = {
	"tanvirtin/monokai.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
	vim.cmd.colorscheme "delek"
	vim.opt.termguicolors = true
	vim.opt.background = "light"
	vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
end

return M
