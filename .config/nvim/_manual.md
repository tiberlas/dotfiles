# NEOVIM
## Tiberius version
# MANUAL

Content:

- [install](#install)
- [plugin manager](#plugin_manager)
- [lsp manager](#lsp_manager)
- [custom functions](#custom_functions)
- [plugin functions](#plugin_functions)
- - [git](#git)
- - [explorer](#explorer)
- - [fzf](#fzf)
- - [clip_explorer](#clip_explorer)
- - [spell_checker](#spell_checker)

---

## install

Required dependencies: ripgrep, fzf
Clone the 'dot-files', then comment the theme in `init.lua` and save it.
This will start the plugin install process. Wait for the installation to be completed and then install the theme before you call the theme configuration file.

## plugin_manager

Plugin manager `Packer`
- `:PackerUpdate` updates the dependencies/install them if required; this is triggered on saving 'init.lua'
- `:PackerClean` remove unused dependencies
- `:PackerSync` perform a Clean and Update
- `:PackerStatus` shows the plugins status

## lsp_manager

- `:LspInfo` shows the attached lsp's for the current buffer
- `:LspInstallInfo` list of available lsp's
- - 'i' to install the selected lsp
- - 'X' remove the selected lsp
- - 'u' update the selected lsp
- `:LspStart` start the lsp client
- `:LspStop` stop the lsp client

## custom_functions

- `:lua _CONVERT_TO_TABS()`
- `:lua _CONVERT_TO_SPACES()`
- `:lua _TAB_THIS_BUFFER()`

## plugin_functions

### git

#### Neogit

Git interface simmilar to Emacs's Magog;
Use `:Neogit` and it opens the client in a new tab; You can:

- create, add or edit an commit
- see git stash
- see the last commit changes

#### Diffview

- `:DiffviewFileHistory %` shows file history of current buffer in new tab
- `:DiffviewFileHistory` shows diff for the selected commit; there is a commit tree
- `:DiffviewOpen HEAD^` show diff of latest commit in new tab
- `:DiffviewOpen HEAD~2`
- `:DiffviewOpen HEAD~4..HEAD~2`
- `:DiffviewOpen d4a7b0d`
- `:DiffviewOpen d4a7b0d..519b30e`
- `:DiffviewOpen origin/main...HEAD`
- `:DiffviewOpen HEAD~2 -- lua/diffview plugin` You can also provide additional paths to narrow down what files are shown:
- `:DiffviewClose` Close the current diffview. You can also use `:tabclose`.
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
- `:'<,'>DiffviewFileHistory` show the file history for the selected range

### explorer

### fzf

### clip_explorer

### spell_checker

This is a white list. I'm using the default vim spell checker and adding the white list to it.
In `~/.config/nvim/spell/en.utf-8.add` add the new "correctly" spelled word
After run command :`mkspell! ~/.config/nvim/spell/en.utf-8.add`

