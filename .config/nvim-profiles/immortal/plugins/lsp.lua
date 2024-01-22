local status_ok, mason = pcall(require, "mason")
if not status_ok then
	print "[PlugErr] mason not loaded"
	return
end
-- LSP SERVERS TO INSTALL
local lsp_list = { "lua_ls", "eslint", "tsserver", "pyright", "clangd", "cssls", "jsonls", "quick_lint_js", "marksman", "spectral", "html" }
-- MOTHER OF ALL ADAPTER PLUGINS, WITH THIS YOU INSTALL LSP, DAP, LINTER, FORMATTER [
mason.setup({
	pip = {
		-- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
		upgrade_pip = false,
		-- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
		-- and is not recommended.
		--
		-- Example: { '--proxy', 'https://proxyserver' }
		install_args = {},
	},
	ui = {
		-- Whether to automatically check for new versions when opening the :Mason window.
		check_outdated_packages_on_open = true,
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = 'none',
		-- Width of the window. Accepts:
		-- - Integer greater than 1 for fixed width.
		-- - Float in the range of 0-1 for a percentage of screen width.
		width = 0.8,
		-- Height of the window. Accepts:
		-- - Integer greater than 1 for fixed height.
		-- - Float in the range of 0-1 for a percentage of screen height.
		height = 0.9,
		icons = {
			-- The list icon to use for installed packages.
			package_installed = '✓',
			-- The list icon to use for packages that are installing, or queued for installation.
			package_pending = '➜',
			-- The list icon to use for packages that are not installed.
			package_uninstalled = '✗',
		},
		keymaps = {
			-- Keymap to expand a package
			toggle_package_expand = '<CR>',
			-- Keymap to install the package under the current cursor position
			install_package = 'i',
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = 'u',
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = 'c',
			-- Keymap to update all installed packages
			update_all_packages = 'U',
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = 'C',
			-- Keymap to uninstall a package
			uninstall_package = 'X',
			-- Keymap to cancel a package installation
			cancel_installation = '<C-c>',
			-- Keymap to apply language filter
			apply_language_filter = '<C-f>',
		},
	},
})
-- ]
-- ADAPTER FOR INSTALLING LANGUAGE SPECIFIC LSP [
require('mason-lspconfig').setup {
	-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
	-- This setting has no relation with the `automatic_installation` setting.
	---@type string[]
	ensure_installed = lsp_list,
	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	-- This setting has no relation with the `ensure_installed` setting.
	-- Can either be:
	--	 - false: Servers are not automatically installed.
	--	 - true: All servers set up via lspconfig are automatically installed.
	--	 - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	--			 Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	---@type boolean
	automatic_installation = true,

	-- See `:h mason-lspconfig.setup_handlers()`
	---@type table<string, fun(server_name: string)>?
	handlers = nil,
}
-- ]
-- INSTALL LSP'S [
local lspconfig = require('lspconfig')
for _, lsp in ipairs(lsp_list) do
	lspconfig[lsp].setup {}
end
-- ]
-- LINTER [
-- Configure linter per file type
-- ensure linter is installed on sys level
-- see how to install linter (usualy through pip)
require('lint').linters_by_ft = {
	yaml = { 'cfn_lint', 'yamllint' },
	javascript = { 'eslint' },
	python = { 'flake8' },
	markdown = { 'markdownlint', }
}
-- Run linter after writing
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
-- ]
-- FORMATTER [
-- Utilities for creating configurations
local util = require "formatter.util"
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
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
			end
		},
		xml = {
			function()
				vim.cmd([[%! xmllint --format -]])
			end
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace
		}
	}
}
-- ]
-- Turn on lsp status information, just a visual indicator when the LSP server attaches to a buffer [
-- Treesitter is needed for this
require('fidget').setup {
	text = {
		spinner = "pipe",      -- animation shown when tasks are ongoing
		done = "✔",          -- character shown when all tasks are complete
		commenced = "Started", -- message shown when task starts
		completed = "Completed", -- message shown when task completes
	},
	align = {
		bottom = true, -- align fidgets along bottom edge of buffer
		right = true, -- align fidgets along right edge of buffer
	},
	timer = {
		spinner_rate = 125, -- frame rate of spinner animation, in ms
		fidget_decay = 2000, -- how long to keep around empty fidget, in ms
		task_decay = 1000, -- how long to keep around completed task, in ms
	},
	window = {
		relative = "win", -- where to anchor, either "win" or "editor"
		blend = 100,    -- &winblend for the window
		zindex = nil,   -- the zindex value for the window
		border = "none", -- style of border for the fidget window
	},
	fmt = {
		leftpad = true,     -- right-justify text in fidget box
		stack_upwards = true, -- list of tasks grows upwards
		max_width = 0,      -- maximum width of the fidget box
		fidget =            -- function to format fidget title
				function(fidget_name, spinner)
					return string.format("%s %s", spinner, fidget_name)
				end,
		task = -- function to format each task line
				function(task_name, message, percentage)
					return string.format(
						"%s%s [%s]",
						message,
						percentage and string.format(" (%s%%)", percentage) or "",
						task_name
					)
				end,
	},
	sources = { -- Sources to configure
		--[[ * = {										 -- Name of source
			ignore = false,					-- Ignore notifications from this source
		}, ]]
	},
	debug = {
		logging = false, -- whether to enable logging, for debugging
		strict = false, -- whether to interpret LSP strictly
	},
}
-- ]
-- LSP KEY BINDINGS [
-- GLOBAL LSP SETTINGS
vim.keymap.set('n', '<leader>lh', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<leader>li', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>lI', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)
		--USE TELESCOPE FOR THIS [
		--vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)
		--]
		-- IN ACTION SECTION (WhichKey) [
		vim.keymap.set('n', '<leader>aw', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>af', function()
			vim.lsp.buf.format { async = true }
		end, opts)
		-- ]
		--workspace
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
	end,
})
-- ]
