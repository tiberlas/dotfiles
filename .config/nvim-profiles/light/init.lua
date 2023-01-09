print"Welcome to light neovim."

-------------------------------------------------------------------------------
-- SETTING
-------------------------------------------------------------------------------

vim.cmd([[let g:mapleader = "\<F10>"]])
--theme
--vim.cmd([[colorscheme monokai]])
--vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

vim.opt.hidden = true
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.pumheight = 10
vim.opt.ruler = true
vim.opt.cmdheight = 2
vim.opt.iskeyword:append "-"
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.showtabline = 2
vim.opt.showmode = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.formatoptions:remove "cro"
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = true
vim.opt.hlsearch = true
vim.opt.tabpagemax = 30
vim.opt.pyxversion = 3
vim.opt.backup = false
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.cursorline = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shortmess:append "c"
vim.opt.showbreak = "↪"
vim.opt.list = true
vim.opt.listchars = { tab=" ", eol="↲", nbsp="␣", trail="", extends="⟩", precedes="⟨", space="•" }
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd "set whichwrap+=<,>,[,],h,l"
-- spellcheck
vim.opt.spelllang = 'en'
vim.opt.spell = true
-------------------------------------------------------------------------------
-- KEY MAPS
-------------------------------------------------------------------------------

OPTS = { noremap = true, silent = true }
KEYMAP = vim.api.nvim_set_keymap

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

