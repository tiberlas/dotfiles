
## Spell-check

For spell-check add:

- in general configuration file add:
```.lua
-- spell checker
vim.opt.spelllang = 'en'
vim.opt.spell = true
```

- functions for spell-check:
```.lua
vim.keymap.set("i", "<C-s>", "<C-x>s", { noremap = true, silent = true }) --show suggestion while typing
vim.keymap.set("n", "<leader>sk", "[s", { noremap = true, silent = true }) --prev miss-spelled word
vim.keymap.set("n", "<leader>sj", "]s", { noremap = true, silent = true }) --next miss-spelled word
vim.keymap.set("n", "<leader>sa", "zg", { noremap = true, silent = true }) --add word to list
vim.keymap.set("n", "<leader>sc", "z=", { noremap = true, silent = true }) --show suggestion
```

- in path: `~/.local/share/nvim-profiles/NEW_PROFILE/nvim/`
  add dir **site** (there is the default white-list)

