local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		'theHamsta/nvim-dap-virtual-text',
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio"
	}
}

function M.config()
	local dap = require('dap')
	-- CONFIG PYTHON DAP
	-- THIS POINTS TO THE VENV WITCH CONTAINS "debugy"
	local python_venv_dap = "/home/t2api/.config/nvim/daps/python/venv12/bin/python"

	dap.adapters.python = function(cb, config)
		if config.request == 'attach' then
			---@diagnostic disable-next-line: undefined-field
			local port = (config.connect or config).port
			---@diagnostic disable-next-line: undefined-field
			local host = (config.connect or config).host or '127.0.0.1'
			cb({
				type = 'server',
				port = assert(port, '`connect.port` is required for a python `attach` configuration'),
				host = host,
				options = {
					source_filetype = 'python',
				},
			})
		else
			cb({
				type = 'executable',
				command = python_venv_dap,
				args = { '-m', 'debugpy.adapter' },
				options = {
					source_filetype = 'python',
				},
			})
		end
	end

	dap.configurations.python = {
		{
			-- The first three options are required by nvim-dap
			type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = 'launch';
			name = "Launch file";

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

			program = "${file}"; -- This configuration will launch the current file if used.
			pythonPath = function()
				-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
				-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
				-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
				return python_venv_dap
			end;
		},
	}

	-- CONFIG DAP UI
	require("dapui").setup({
		controls = {
			element = "console",
			enabled = true,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = ""
			}
		},
		element_mappings = {},
		expand_lines = true,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" }
			}
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = ""
		},
		layouts = { {
			elements = { {
				id = "watches",
				size = 0.25
			}, {
				id = "scopes",
				size = 0.75
			} },
			position = "left",
			size = 60
		}, {
			elements = { {
				id = "breakpoints",
				size = 0.25
			}, {
				id = "console",
				size = 0.75
			} },
			position = "right",
			size = 60
		} },
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t"
		},
		render = {
			indent = 1,
			max_value_lines = 100
		}
	})
	local dapui = require("dapui")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	-- CONFIG DAP VIRTUAL TEXT
	require("nvim-dap-virtual-text").setup {
		enabled = true,										 -- enable this plugin (the default)
		enabled_commands = true,					 -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
		highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
		highlight_new_as_changed = false,  -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
		show_stop_reason = true,					 -- show stop reason when stopped for exceptions
		commented = false,								 -- prefix virtual text with comment string
		only_first_definition = true,			 -- only show virtual text at first definition (if there are multiple)
		all_references = false,						 -- show virtual text on all all references of the variable (not only definitions)
		clear_on_continue = false,				 -- clear virtual text on "continue" (might cause flickering when stepping)
		--- A callback that determines how a variable is displayed or whether it should be omitted
		--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
		--- @param buf number
		--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
		--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
		--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
		--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
		display_callback = function(variable, buf, stackframe, node, options)
			if options.virt_text_pos == 'inline' then
				return ' = ' .. variable.value
			else
				return variable.name .. ' = ' .. variable.value
			end
		end,
		-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
		virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

		-- experimental features:
		all_frames = false,		 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
		virt_lines = false,		 -- show virtual lines instead of virtual text (will flicker!)
		virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
		-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
	}
end

return M
