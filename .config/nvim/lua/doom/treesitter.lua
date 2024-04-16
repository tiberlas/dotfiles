local M = {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
	}
}
function M.config()
	require("nvim-treesitter.configs").setup {
	ensure_installed = { "c", "lua", "bash", "markdown", "markdown_inline", "css", "vim", "vimdoc", "query", "fish", "git_config", "gitignore", "html", "javascript", "json", "python", "scss", "typescript" },
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					['<leader>fj'] = '@function.outer',
					['<leader>cj'] = '@class.outer',
				},
				goto_next_end = {
					['<leader>fJ'] = '@function.outer',
					['<leader>cJ'] = '@class.outer',
				},
				goto_previous_start = {
					['<leader>fk'] = '@function.outer',
					['<leader>ck'] = '@class.outer',
				},
				goto_previous_end = {
					['<leader>fK'] = '@function.outer',
					['<leader>cK'] = '@class.outer',
				},
			},
		},
	}

end

return M
