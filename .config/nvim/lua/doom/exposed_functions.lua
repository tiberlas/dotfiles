function _CONVERT_TO_TABS(tab_width)
	vim.opt.expandtab = false
	vim.cmd([[retab!]])
	if tab_width ~= nil then
		vim.opt.tabstop = tonumber(tab_width)
	else
		vim.opt.tabstop = 2
	end
end

function _CONVERT_TO_SPACES(tab_width)
	vim.opt.expandtab = true
	vim.cmd([[retab!]])
	if tab_width ~= nil then
		vim.opt.shiftwidth = tonumber(tab_width)
	else
		vim.opt.shiftwidth = 2
	end
end

function _TAB_THIS_BUFFER()
	vim.cmd([[tabedit %]])
end

function _INSTALL_MASON_SERVERS()
	local servers = require "doom.servers"
	-- LSP are installed through mason-lspconfig
	for _,server_type in ipairs({"dap", "lint", "formatter"}) do
		for _,server in ipairs(servers[server_type]) do
			vim.cmd("MasonInstall "..server)
		end
	end
end
