
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

## Create new configuration

config:
- Duplicate **new-blood** dir and rename it to the new config
- in init.lua:
- - comment: *require(".config.general")*
- - set *importConfigurations* and *usePlugins* to false
- restart and run `:PackerSync`
- set *usePlugins* to true
- restart and run `:PackerSync`
- set *importConfigurations* to true and uncomment the import
- restart and run `:PackerSync`

launching:
- In ~/utils/bash-script/ add new script based on nvim-new-blood.sh
- add abbr in fish

