-------------------------------------------------------------------------------
--
--   _    _   _ _               _             author: t.tiberius
--  | |  | | (_) |             (_)            usage:
--  | |_ | |_ _| |__   ___ _ __ _ _   _ ___     neovim configuration file
--  | __|| __| | '_ \ / _ \ '__| | | | / __|
--  | |_ | |_| | |_) |  __/ |  | | |_| \__ \
--   \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- GLOBAL SETTINGS
-------------------------------------------------------------------------------

vim.cmd([[let g:mapleader = "\<F10>"]])
OPTS = { noremap = true, silent = true }
KEYMAP = vim.api.nvim_set_keymap

require(".general")
require(".key-maps")
require(".fun-lib")

-------------------------------------------------------------------------------
-- PLUGINS
-------------------------------------------------------------------------------

local plug_path = ".plug-config"
local theme_path = ".theme"

PLUGINS = {
	-- packet manager
	{ "wbthomason/packer.nvim" },
	-- themes
	{ "tanvirtin/monokai.nvim", theme_path .. ".monokai" },
	--{ "folke/tokyonight.nvim", theme_path..".tokyonight" },
	-- USEFULL STUFF
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "windwp/nvim-autopairs", plug_path .. ".autopairs" },
	{ { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }, plug_path .. ".lualine", },
	{ "voldikss/vim-floaterm", plug_path .. ".floaterm" },
	{ "b3nj5m1n/kommentary", plug_path .. ".comment" },
	{ "folke/which-key.nvim", plug_path .. ".which-key" },
	{ "antoinemadec/FixCursorHold.nvim" },
	-- TODO: VIEW LUA ALT
	{ "tpope/vim-surround" },
	{ "lukas-reineke/indent-blankline.nvim", plug_path .. ".indent-blankline" },
	{ { "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons" }, plug_path .. ".luatab" },
	{ 'karb94/neoscroll.nvim', plug_path..".neoscroll" },
	{ 'petertriho/nvim-scrollbar', plug_path..".nvim-scrollbar" },
	{ "kyazdani42/nvim-web-devicons" },
	{ { "phaazon/hop.nvim", branch = "v2" }, plug_path..".hop" },
	-- LSP
	{ "neovim/nvim-lspconfig", plug_path .. "./lsp/init" },
	{ "williamboman/nvim-lsp-installer" },
	{ "jose-elias-alvarez/null-ls.nvim" }, -- code formating
	-- auto compleation
	{ "L3MON4D3/LuaSnip" }, --snippet engine, renders popup windows
	{ "rafamadriz/friendly-snippets" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/nvim-cmp", plug_path .. ".cmp" }, -- The completion plugin; here configure rest cmp plugins
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "f3fora/cmp-spell", plug_path..".cmp-spell" },
	-- file explorer
	-- TOOD: map l,h to enter
	{ { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim", } } },
	{ "nvim-telescope/telescope.nvim", plug_path .. ".tj" },
	{ { "nvim-telescope/telescope-fzf-native.nvim", run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build", }, },
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-symbols.nvim" },
	{ { "AckslD/nvim-neoclip.lua", requires = { { "nvim-telescope/telescope.nvim" }, { "ibhagwan/fzf-lua" } } }, plug_path .. ".tj-clip", },
	{ "ThePrimeagen/harpoon", plug_path .. ".harpoon" },
	-- git
	{ "lewis6991/gitsigns.nvim", plug_path .. ".git-sign" },
	{ { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }, plug_path .. ".diffview" },
	{ { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }, plug_path .. ".neogit" },

	-- PLUGINS GRAVE
	{ { "nvim-treesitter/nvim-treesitter", run = function() require("nvim-treesitter.install").update({ with_sync = true }) end, }, plug_path .. ".treesitter", },
	-- { "lewis6991/impatient.nvim", plug_path .. ".impatient" }, speeds up plugin load time
	-- { { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }, plug_path..".alpha" },
}

-------------------------------------------------------------------------------
-- PLUGINS INTERNAL SETUP
-------------------------------------------------------------------------------

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost init.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
	vim.notify("FATAL ERROR; Couldn't install packer")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function(use)
	for k, v in pairs(PLUGINS) do
		use(v[1])
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

-- import config files for plugin
for k, v in pairs(PLUGINS) do
	if v[2] ~= nil then
		require(v[2])
	end
end
