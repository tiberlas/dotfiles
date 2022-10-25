-- jumps in wraps
KEYMAP("n","j", "gj", OPTS)
KEYMAP("n","k", "gk", OPTS)
-- escape from insert/visual mode
KEYMAP("i","jk", "<Esc>", OPTS)
KEYMAP("i","kj", "<Esc>", OPTS)
KEYMAP("i","KJ", "<Esc>", OPTS)
KEYMAP("v","KJ", "<Esc>", OPTS)
-- remove highlight form found words
-- mapped in which-key
-- KEYMAP("n","<leader>d", ":nohlsearch<CR>", OPTS)
-- use Ctrl+j/k to navigate through pop-up list
KEYMAP("i", "<C-j>", "<C-n>", OPTS)
KEYMAP("i", "<C-k>", "<C-p>", OPTS)
-- use Alt+h/j/k/l to resize window
KEYMAP("n", "<M-j>", ":resize -4<CR>", OPTS)
KEYMAP("n", "<M-k>", ":resize +4<CR>", OPTS)
KEYMAP("n", "<M-h>", ":vertical resize +4<CR>", OPTS)
KEYMAP("n", "<M-l>", ":vertical resize -4<CR>", OPTS)
-- on TAB enter insert mode and add tab simbol
KEYMAP("n", "<TAB>", "I<TAB>", OPTS)
-- Ctrl+U/u uppercase or lower case the word
KEYMAP("n", "gU", "viwU<ESC>", OPTS)
KEYMAP("n", "gu", "viwu<ESC>", OPTS)
-- better tabbing
KEYMAP("v", "<", "<gv", OPTS)
KEYMAP("v", ">", ">gv", OPTS)
-- navigate through windows with Ctrl-h/j/k/l
KEYMAP("n", "<C-h>", "<C-w>h", OPTS)
KEYMAP("n", "<C-j>", "<C-w>j", OPTS)
KEYMAP("n", "<C-k>", "<C-w>k", OPTS)
KEYMAP("n", "<C-l>", "<C-w>l", OPTS)
KEYMAP("n", "<C-q>", "<C-w>q", OPTS)
-- center cursor when jumping
KEYMAP("n", "n", "nzzzv", OPTS)
KEYMAP("n", "N", "Nzzzv", OPTS)
KEYMAP("n", "J", "mzJ`z", OPTS)
KEYMAP("n", "G", "Gzz", OPTS)
-- swapp lines with zj and zk
KEYMAP("n", "zj", ":m .+1<CR>==", OPTS)
KEYMAP("n", "zk", ":m .-2<CR>==", OPTS)
-- stay on word when highlighted
KEYMAP("n", "*", "*N", OPTS)
