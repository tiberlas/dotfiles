------------------------------------------
-- GENERAL CONFIGURATION
------------------------------------------
require(".config.general")
require(".config.key-maps")
require(".config.fun-lib")

------------------------------------------
-- PLUGINS
-- type: { plugin_name: string|table, plugin_config_path: string }
------------------------------------------

-- Select how to build plugins
local importConfigurations = true -- set to false when installing new plugins
local allPlugins = true  -- set to false when recreating setup from scratch

local PLUGIN_LIST = {
}
if allPlugins then
	PLUGIN_LIST = {
	-- LSP Configuration & Plugins
	{
		{
			'neovim/nvim-lspconfig',
			requires = {
				-- Automatically install LSPs to stdpath for neovim
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',
				-- Useful status updates for LSP
				'j-hui/fidget.nvim',
				-- Additional lua configuration, makes nvim stuff amazing
				'folke/neodev.nvim',
			},
		},
		'lsp'
	},
		-- Autocompletion
		{
			{
				'hrsh7th/nvim-cmp',
				requires = {
					'hrsh7th/cmp-nvim-lsp',
					'L3MON4D3/LuaSnip',
					'saadparwaiz1/cmp_luasnip'
				},
			},
		},
		-- Highlight, edit, and navigate code; has multiple modules
		{
			{
				'nvim-treesitter/nvim-treesitter',
				requires = {
					'nvim-treesitter/nvim-treesitter-textobjects',
				}
			},
			'treesitter'
		},
		{ 'windwp/nvim-autopairs', 'autopairs' }, --autoclose '"`[{(...
		{
			{
				'phaazon/hop.nvim',
				branch = 'v2', -- optional but strongly recommended
			}, 'hop'
		}, -- vim easy motions
		-- Git
		{ 'lewis6991/gitsigns.nvim', 'gitsigns' },
		{
			{
				"sindrets/diffview.nvim",
				requires = {
					"nvim-lua/plenary.nvim",
					"kyazdani42/nvim-web-devicons"
				}
			},
			"diffview"
		},
		{ "tpope/vim-surround" },
		-- Theme
		{ 'tanvirtin/monokai.nvim' },
		-- Fancier statusline
		{ 'nvim-lualine/lualine.nvim', 'lualine' },
		-- indentation guides even on blank lines
		{ 'lukas-reineke/indent-blankline.nvim', 'indent-blankline' },
		-- comment visual regions/lines
		{ 'numToStr/Comment.nvim', 'comment' },
		{
			{
				"nvim-neo-tree/neo-tree.nvim",
				branch = "v2.x",
				requires = {
					"nvim-lua/plenary.nvim",
					"kyazdani42/nvim-web-devicons",
					"MunifTanjim/nui.nvim",
				}
			},
			'neo-tree'
		},
		-- Fuzzy Finder (files, lsp, etc)
		{
			{
				'nvim-telescope/telescope.nvim',
				branch = '0.1.x',
				requires = {
					'nvim-lua/plenary.nvim'
				}
			},
			'telescope'
		},
		{
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'make',
				cond = vim.fn.executable 'make' == 1
			}
		},
		--[[ { "AckslD/nvim-neoclip.lua", "telescope-clip" }, ]]
		{ 'ThePrimeagen/harpoon' },
		-- key combo explained
		{
			{
				"folke/which-key.nvim",
				config = function()
					vim.o.timeoutlen = 300
				end
			},
			"which-key"
		},
		-- DEBUGGER
		{ 'mfussenegger/nvim-dap', 'debugger' },
		{ 'rcarriga/nvim-dap-ui' },
		--[[ {'David-Kunz/jester', 'test' } ]]
		{
			{
				"nvim-neotest/neotest",
				requires = {
					"folke/neodev.nvim",
					"nvim-lua/plenary.nvim",
					"nvim-neotest/neotest-plenary",
					"nvim-treesitter/nvim-treesitter",
					"antoinemadec/FixCursorHold.nvim",
					-- test frameworks
					'haydenmeade/neotest-jest',
				}
			}, 'neo-test'
		},
		--{ 'folke/neodev.nvim', 'neo-dev' }
	}
end

------------------------------------------
-- INTERNAL PACKER
------------------------------------------
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print '=================================='
	print"    NO PLUGIN MANAGER FOUND"
	print"    PLEASE INSTALL PACKER [https://github.com/wbthomason/packer.nvim]"
	print '=================================='
	return
end
packer.startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	for _, v in pairs(PLUGIN_LIST) do
		use(v[1])
		if v[2] ~= nil and importConfigurations then
			require('.plugins.' .. v[2])
		end
	end

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, 'custom.plugins')
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require('packer').sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.

-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '      then restart nvim'
	print '=================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost init.lua source <afile> | PackerSync
	augroup end
]])


