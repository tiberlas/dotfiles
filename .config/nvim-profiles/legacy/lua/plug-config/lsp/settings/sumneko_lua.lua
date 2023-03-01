return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim", "OPTS", "KEYMAP" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
