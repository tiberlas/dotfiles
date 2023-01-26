local status_inst, treesitter_install = pcall(require, "nvim-treesitter.install")
local status_config, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_inst or not status_config then
	print"[PlugErr] treesitter not loaded"
	return
end

treesitter_install.update { with_sync = true }

treesitter_configs.setup {
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'vim' },

	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	indent = { enable = true, disable = { 'python' } },
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

