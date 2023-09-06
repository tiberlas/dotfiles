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

function _UPDATE()
	vim.cmd([[source init.lua]])
	vim.cmd([[PackerClean]])
	vim.cmd([[PackerInstall]])
	vim.cmd([[TSUpdate]])
	vim.cmd([[TSUpdateSync]])
end
