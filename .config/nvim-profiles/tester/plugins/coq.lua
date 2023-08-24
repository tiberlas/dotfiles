vim.g.coq_settings = {
	auto_start = 'shut-up',
	keymap = {
		jump_to_mark = '<c-n>'
	}
}

coq = require 'coq'

require("coq_3p") {
	{ src = "nvimlua", short_name = "nLUA", conf_only = true },
	{ src = "vimtex",  short_name = "vTEX" },
	--{ src = "copilot", short_name = "COP", accept_key = "<c-f>" },
	--{ src = "codeium", short_name = "COD" },
	--{ src = "vim_dadbod_completion", short_name = "DB"},
	--{ src = "dap" },
}
