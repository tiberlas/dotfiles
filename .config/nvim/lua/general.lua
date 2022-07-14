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
vim.o.background = "dark"

vim.cmd "set whichwrap+=<,>,[,],h,l"

