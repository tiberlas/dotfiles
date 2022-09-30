local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	print"[PlugErr] alpha not loaded"
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                                            ]],
	[[ 88888888888 d8b 888      d8b             d8b               ]],
	[[     888     Y8P 888      Y8P             Y8P               ]],
	[[     888         888                                        ]],
	[[     888     888 88888b.  888    888  888 888 88888b.d88b.  ]],
	[[     888     888 888 "88b 888    888  888 888 888 "888 "88b ]],
	[[     888     888 888  888 888    Y88  88P 888 888  888  888 ]],
	[[     888     888 888 d88P 888 d8b Y8bd8P  888 888  888  888 ]],
	[[     888     888 88888P"  888 Y8P  Y88P   888 888  888  888 ]],
	[[                                                            ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	return "t.tiberius"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
