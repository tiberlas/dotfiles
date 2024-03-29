local status_ok, neoclip  = pcall(require, "neoclip")
if not status_ok then
	print"[PlugErr] neoclip not loaded"
	return
end

neoclip.setup({
	history = 1000,
	enable_persistent_history = false,
	length_limit = 1048576,
	continuous_sync = false,
	db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
	filter = nil,
	preview = true,
	default_register = {'"', '*', '+'},
	default_register_macros = "q",
	enable_macro_history = true,
	content_spec_column = true,
	on_paste = {
		set_reg = false,
	},
	on_replay = {
		set_reg = false,
	},
	keys = {
		telescope = {
			i = {
				select = "<cr>", -- in register 0 is selected
				paste = "<c-p>", -- paste the selection where the cursor was before activating this
				paste_behind = "<c-l>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				up = "<c-k>",
				down = "<c-j>",
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				delete = "d",
				custom = {},
			},
		},
		fzf = {
			select = "default",
			paste = "ctrl-p",
			paste_behind = "ctrl-k",
			custom = {},
		},
	},
})
