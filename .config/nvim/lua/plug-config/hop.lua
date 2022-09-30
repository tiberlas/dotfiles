local status_ok, hop = pcall(require, "hop")
if not status_ok then
	print"[PlugErr] hop not loaded"
	return
end

hop.setup()

-- normal mode (easymotion-like)
KEYMAP("n", "<Leader>eb", "<cmd>HopWordBC<CR>", OPTS)
KEYMAP("n", "<Leader>ew", "<cmd>HopWordAC<CR>", OPTS)
KEYMAP("n", "<Leader>ej", "<cmd>HopLineAC<CR>", OPTS)
KEYMAP("n", "<Leader>ek", "<cmd>HopLineBC<CR>", OPTS)
-- visual mode (easymotion-like)
KEYMAP("v", "<Leader>ew", "<cmd>HopWordAC<CR>", OPTS)
KEYMAP("v", "<Leader>eb", "<cmd>HopWordBC<CR>", OPTS)
KEYMAP("v", "<Leader>ej", "<cmd>HopLineAC<CR>", OPTS)
KEYMAP("v", "<Leader>ek", "<cmd>HopLineBC<CR>", OPTS)
-- search for one char
KEYMAP("n", "<Leader>ef", "<cmd>HopChar1AC<CR>", OPTS)
KEYMAP("n", "<Leader>eF", "<cmd>HopChar1BC<CR>", OPTS)
-- search for two chars
KEYMAP("n", "<Leader>et", "<cmd>HopChar2AC<CR>", OPTS)
KEYMAP("n", "<Leader>eT", "<cmd>HopChar2BC<CR>", OPTS)
-- search for word
KEYMAP("n", "<Leader>e/", "<cmd>HopPattern<CR>", OPTS)

