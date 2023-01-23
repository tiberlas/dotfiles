local status_ok, hop = pcall(require, "hop")
if not status_ok then
	print"[PlugErr] hop not loaded"
	return
end

hop.setup{
	keys = 'asdfghjkl;zxcvbnm'
}

-- [[
-- Short hands:
-- AC  after current char
-- BC before current char
-- MW in all open windows
-- ]]

-- hop word in line
vim.keymap.set("n", "w", "<cmd>HopWordCurrentLineAC<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "w", "<cmd>HopWordCurrentLineAC<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "b", "<cmd>HopWordCurrentLineBC<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "b", "<cmd>HopWordCurrentLineBC<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "f", "<cmd>HopChar1CurrentLineAC<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "f", "<cmd>HopChar1CurrentLineAC<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "F", "<cmd>HopChar1CurrentLineBC<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "F", "<cmd>HopChar1CurrentLineBC<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "t", "<cmd>HopChar1CurrentLineAC<CR>h", { noremap = true, silent = true })
vim.keymap.set("v", "t", "<cmd>HopChar1CurrentLineAC<CR>h", { noremap = true, silent = true })
vim.keymap.set("n", "T", "<cmd>HopChar1CurrentLineBC<CR>l", { noremap = true, silent = true })
vim.keymap.set("v", "T", "<cmd>HopChar1CurrentLineBC<CR>l", { noremap = true, silent = true })

-- hop word in buffer
vim.keymap.set("n", "W", "<cmd>HopWordAC<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "W", "<cmd>HopWordAC<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "B", "<cmd>HopWordBC<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "B", "<cmd>HopWordBC<CR>", { noremap = true, silent = true })

