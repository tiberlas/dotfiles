function _CONVERT_TO_TABS()
	vim.opt.expandtab = false
	vim.cmd([[retab!]])
end

function _CONVERT_TO_SPACES()
	vim.opt.expandtab = true
	vim.cmd([[retab!]])
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
