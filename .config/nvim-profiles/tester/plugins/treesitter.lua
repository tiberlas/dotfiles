local status_inst, treesitter_install = pcall(require, "nvim-treesitter.install")
local status_config, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_inst or not status_config then
	print"[PlugErr] treesitter not loaded"
	return
end

treesitter_install.update({ with_sync = true })()
treesitter_configs.setup {
	-- A list of parser names, available: `https://github.com/nvim-treesitter/nvim-treesitter#supported-languages`
	ensure_installed = { "c", "lua", "bash", "css", "vim", "vimdoc", "query", "fish", "git_config", "gitignore", "html", "javascript", "json", "python", "scss", "typescript" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },
	ignore_install = {  },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,
		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		--[[ disable = { "c", "rust" }, ]]
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		--[[
		disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
						return true
				end
		end,
		--]]

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
	indent = {
    enable = true
  },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<leader>tt',
			node_incremental = '<leader>tt',
			scope_incremental = '<leader>ts',
			node_decremental = '<leader>tu',
		},
	},
		textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				['<leader>tk'] = '@function.outer',
				['<leader>tl'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['<leader>tj'] = '@function.outer',
				['<leader>th'] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>ta'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>tA'] = '@parameter.inner',
			},
		},
	},
}
