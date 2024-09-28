require "doom.options"
require "doom.keymaps"
require "doom.exposed_functions"

local lazy_plugin_spec = {
	{ import = "doom.colorscheme" },
	{ import = "doom.devicons" },
	{ import = "doom.treesitter" },
	{ import = "doom.mason" },      -- install lsp, dap, linter, formatter
	{ import = "doom.lsp-config" }, -- lsp
	{ import = "doom.schemastore" }, -- lsp for JSON, like package.json
	{ import = "doom.lint" },
	{ import = "doom.formatter" },
	{ import = "doom.cmp" },        -- auto complete
	{ import = "doom.dap" },
	{ import = "doom.neo-test" },
	{ import = "doom.telescope" },
	{ import = "doom.gitsigns" },
	{ import = "doom.gitdiff" },
	{ import = "doom.autopairs" },
	{ import = "doom.comment" },
	{ import = "doom.which-key" },
	{ import = "doom.ident-blackline" },
	{ import = "doom.alpha" },
	{ import = "doom.iluminati" },
	{ import = "doom.hop" },
	{ import = "doom.zen" },
	{ import = "doom.org-mod" },
	{ import = "doom.org-mod-bullets" },
	{ import = "doom.org-mod-table" },
	{ import = "doom.ranger" },
}

-- install lazy (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
-- install the plugins
require("lazy").setup {
	spec = lazy_plugin_spec,
	install = {
		colorscheme = { "monokai", "default" },
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
}
