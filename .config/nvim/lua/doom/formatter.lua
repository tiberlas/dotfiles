local M = {
	"mhartington/formatter.nvim",
}

function M.config()
	local util = require("formatter.util")

	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			-- Add formatter for filetype: `https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes`
			lua = {
				-- "formatter.filetypes.lua" defines default configurations for the
				-- "lua" filetype
				require("formatter.filetypes.lua").stylua,
				-- You can also define your own configuration
				function()
					-- Supports conditional formatting
					if util.get_current_buffer_file_name() == "special.lua" then
						return nil
					end
					-- Full specification of configurations is down below and in Vim help
					-- files
					return {
						exe = "stylua",
						args = {
							"--search-parent-directories",
							"--stdin-filepath",
							util.escape_path(util.get_current_buffer_file_path()),
							"--",
							"-",
						},
						stdin = true,
					}
				end,
			},
			python = {
				require("formatter.filetypes.python").black,
			},
			javascript = {
				require("formatter.filetypes.javascript").prettier,
			},
			typescript = {
				require("formatter.filetypes.typescript").prettier,
			},
			json = {
				require("formatter.filetypes.json").prettier,
			},
			yaml = {
				require("formatter.filetypes.yaml").prettier,
			},
			html = {
				require("formatter.filetypes.html").prettier,
			},
			css = {
				require("formatter.filetypes.css").prettier,
			},
			xml = {
				require("formatter.filetypes.xml").xmlformat,
			},
			markdown = {
				require("formatter.filetypes.markdown").prettier,
			},
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			-- C#
			cs = {
				require("formatter.filetypes.cs").clangformat,
			},
			-- Use the special "*" filetype for defining formatter configurations on
			-- any filetype
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
end

return M
