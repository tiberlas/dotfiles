-- jumps in wraps when needed
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- escape from insert/visual mode
vim.keymap.set("i","jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i","kj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i","KJ", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("v","KJ", "<Esc>", { noremap = true, silent = true })
-- jump on line start
vim.keymap.set("n","0", "0w", { noremap = true, silent = true })
-- use Ctrl+j/k to navigate through pop-up list
vim.keymap.set("i", "<C-j>", "<C-n>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<C-p>", { noremap = true, silent = true })
-- use Alt+h/j/k/l to resize window
vim.keymap.set("n", "<M-j>", ":resize -4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", ":resize +4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-h>", ":vertical resize +4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", ":vertical resize -4<CR>", { noremap = true, silent = true })
-- on TAB enter insert mode and add tab simbol
vim.keymap.set("n", "<TAB>", "I<TAB>", { noremap = true, silent = true })
-- Ctrl+U/u uppercase or lower case the word
vim.keymap.set("n", "gU", "viwU<ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "gu", "viwu<ESC>", { noremap = true, silent = true })
-- better tabbing
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
-- navigate through windows with Ctrl-h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", "<C-w>q", { noremap = true, silent = true })
-- center cursor when jumping
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true, silent = true })
-- swapp lines with zj and zk
vim.keymap.set("n", "zj", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "zk", ":m .-2<CR>==", { noremap = true, silent = true })
-- stay on word when highlighted
vim.keymap.set("n", "*", "*Nzz", { noremap = true, silent = true })
-- spell check
vim.keymap.set("i", "<C-s>", "<C-x>s", { noremap = true, silent = true }) --show suggestion while typing
vim.keymap.set("n", "<leader>sk", "[s", { noremap = true, silent = true }) --prev miss-spelled word
vim.keymap.set("n", "<leader>sj", "]s", { noremap = true, silent = true }) --next miss-spelled word
vim.keymap.set("n", "<leader>sa", "zg", { noremap = true, silent = true }) --add word to list
vim.keymap.set("n", "<leader>sc", "z=", { noremap = true, silent = true }) --show suggestion

-- copy to registar t; useful for multiple pasting
vim.keymap.set("n", "<Leader>e", "\"t", { noremap = true, silent = true })
vim.keymap.set("v", "<Leader>e", "\"t", { noremap = true, silent = true })
