Tvim
Tiberiuses neo vim
___

## Super Yank

When yanking and pasting use [Super Yank](./lua/doom/which-key.lua) to save it in a special register.
- select a word and "<leader>e y" to store it
- do something
- paste it with "<leader>e p"

## SNIPPETS

Use cmp to find **SNIP** option. E.G. in python:
- type `def`
- then activate cmp with `C-<space>`
- chose the function snippet
- it will generate the following:
```
def $1($2)
    $3
```
- the $<NUM> are placeholders; You just type the value you want and the press <Tab> to jump to next place holder.

## GREP

Find text "my_fun" only in python files: `"my_fun" -t py`, the quotes are required.
Find text "my_fun" in a dir: `"my_fun" -g src/test/*`


# SCRATCH

nvim-dap

USE THIS COMMAND TO LOAD THE ADAPTER VENV PATH BEFORE YOU RUN TESTS
`lua require('dap-python').resolve_python =  "/mnt/md0/workspace/oll/venvs-platform/venv10/bin/python"`



	-- THIS POINTS TO THE VENV WITCH CONTAINS "debugpy"
	local python_venv_dap = "/home/t2api/.config/nvim/daps/python/v12/bin/python"

	dap.adapters.python = function(cb, config)
		if config.request == "attach" then
			---@diagnostic disable-next-line: undefined-field
			local port = (config.connect or config).port
			---@diagnostic disable-next-line: undefined-field
			local host = (config.connect or config).host or "127.0.0.1"
			cb({
				type = "server",
				port = assert(port, "`connect.port` is required for a python `attach` configuration"),
				host = host,
				options = {
					source_filetype = "python",
				},
			})
		else
			cb({
				type = "executable",
				command = python_venv_dap,
				args = { "-m", "debugpy.adapter" },
				options = {
					source_filetype = "python",
				},
			})
		end
	end

	dap.configurations.python = {
		{
			-- The first three options are required by nvim-dap
			type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = "launch",
			name = "Launch file",

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

			program = "${file}", -- This configuration will launch the current file if used.
			pythonPath = function()
				-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
				-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
				-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				-- OLL PLATFORM
				elseif vim.fn.executable("/mnt/md0/workspace/oll/venvs-platform/venv10") == 1 then
					return "/mnt/md0/workspace/oll/venvs-platform/venv10/bin/python"
				else
					return python_venv_dap
				end
			end,
		},
	}
