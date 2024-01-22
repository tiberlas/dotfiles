---------------
-- KEY MAPPINGS
---------------

-- set easier mapping
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- jumps in wraps when needed
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- jump on the beginning/end of line
keymap({"n", "o", "x"}, "<s-l>", "$", opts)
keymap({"n", "o", "x"}, "<s-h>", "_", opts)
-- vim to behave correctly
keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)
-- escape from insert/visual mode
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)
keymap({"i", "v"}, "KJ", "<Esc>", opts)
-- use Ctrl+j/k to navigate through pop-up list
keymap("i", "<C-j>", "<C-n>", opts)
keymap("i", "<C-k>", "<C-p>", opts)
-- use Alt+h/j/k/l to resize window
keymap("n", "<M-j>", ":resize -4<CR>", opts)
keymap("n", "<M-k>", ":resize +4<CR>", opts)
keymap("n", "<M-h>", ":vertical resize +4<CR>", opts)
keymap("n", "<M-l>", ":vertical resize -4<CR>", opts)
-- navigate through windows with Ctrl-h/j/k/l
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-q>", "<C-w>q", opts)
-- Ctrl+U/u uppercase or lower case the word
keymap("n", "gU", "viwU<ESC>", opts)
keymap("n", "gu", "viwu<ESC>", opts)
-- center line when jumping
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "*", "*Nzz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "J", "mzJ`z", opts)
keymap("n", "G", "Gzz", opts)
-- swapp lines with zj and zk
keymap("n", "zj", ":m .+1<CR>==", opts)
keymap("n", "zk", ":m .-2<CR>==", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- do not save text to default register when pasting on top of selected text
keymap("x", "p", [["_dP]])
-- copy to register t; useful for multiple pasting
keymap("n", "<Leader>e", "\"t", opts)
keymap("v", "<Leader>e", "\"t", opts)
