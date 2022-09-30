# NEOVIM lua edition

## CUSTOM FUN

- `:lua _CONVERT_TO_TABS()`
- `:lua _CONVERT_TO_SPACES()`

## Plugins

### Pluginn manager

Configured when you save 'init.lua' to update the Plugins

### LSP

> ':LspInstallInfo'  
> to see and install awailable LSP clients  
> To install hightlight a wanted LSP and press 'i'
> To remove hightlight the desire LSP and press 'X'
> To update hightlight the desire LSP and press 'u'

### Null ls

Code formater, diagnostic tool,
You need to install all the diagnostic tools on your system and then you can refer to them in this plugin.
In the plugin setup you define what tools to use.

To see what tools are supported by the plugin:
- open the desired file
- use command: `:NullLsInfo`

### Neogit

Git interface simmilar to Emacs's Magog;
Use `:Neogit` and it opens the client in a new tab;
You can:

- create, add or edit an commit
- see git stash
- see the last commit changes

### Diffview

A git tool for viewing diff; It can:

- `:DiffviewFileHistory %` shows file history of current buffer in new tab
- `:DiffviewOpen` show diff of latest commit in new tab
- `:DiffviewOpen HEAD~2`
- `:DiffviewOpen HEAD~4..HEAD~2`
- `:DiffviewOpen d4a7b0d`
- `:DiffviewOpen d4a7b0d..519b30e`
- `:DiffviewOpen origin/main...HEAD`
- `:DiffviewOpen HEAD~2 -- lua/diffview plugin` You can also provide additional paths to narrow down what files are shown:
- `:DiffviewClose` Close the current diffview. You can also use :tabclose.
- `:DiffviewToggleFiles` Toggle the files panel.
- `:DiffviewFocusFiles` Bring focus to the files panel.
- `:DiffviewRefresh` Update stats and entries in the file list of the current Diffview.
- `:DiffviewFileHistory`
- `:DiffviewFileHistory %`
- `:DiffviewFileHistory path/to/some/file.txt`
- `:DiffviewFileHistory path/to/some/directory`
- `:DiffviewFileHistory include/this and/this :!but/not/this`
- `:DiffviewFileHistory --range=origin..HEAD`
- `:DiffviewFileHistory --range=feat/example-branch`
- `:'<,'>DiffviewFileHistory`

## Spell

In `~/.config/nvim/spell/en.utf-8.add` add the new "correctly" spelled word
After run command :`mkspell! ~/.config/nvim/spell/en.utf-8.add`

