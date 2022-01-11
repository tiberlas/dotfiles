# VIM CONFIG

## VimPlug

For plugins use a plugin manager **vim-plug**: `https://github.com/junegunn/vim-plug`
Plugins are installed in **plugins file** thats located *~/.config/nvim/vim-plug/plugins.vim*

useful commands:

- `:PlugStatus` check status of your plugins
- `:PlugInstall` install all defined plugins from **plugins file**
- `:PlugUpdate` updates the installed plugins
- `:PlugClear` to remove plugins that have been removed from the **plugins file**
- `:PlugUpdate` update the vim plug manager

When changing the plugins you have to source the file: `sourve ~/.config/nvim/vim-plug/plugins.vim`

## Coc

useful commands:

- `:CocInstall EX` install an extension called EX
- `:CocUninstall EX` uninstall en extension
- `:CocList commands` list of all available commands from extensions
- `:CocList extensions` list of installed extensions

- `\space+c` show code actions (auto import, ...)
- `[g` go to next error
- `]g` go to previous error
- `gd` go to definition
- `gr` go to reference
- `Ctrl+space` autocomplete in **insert mode**
- `K` see definition
- `\r` rename
- `\F` format selected bud not great
- `space a` list of all errors in the file
- `space e` activate/deactivate extensions
- `space c` coc commands, **restart**

### Coc-snippets

ads custom defined snippets and some are pre defined

`CocList snippets` show all snippets

### Spell checker

In normal or visual mode with `ctrl+space` shows the correct spell options.
This is configured in `plug-config/coc.vim`.

## File Explorer

installed through coc: `coc-explorer`

commands:

- `space+e` open explorer
- `space+f` open floating explorer

- `*` toggle selection
- `tab` open menu in file explorer (create a dir, file, exc)

- `gl` expand dir recursively
- `gh` collapse dir recursively
- `o` toggle expand dir
- `Ic` toggle preview file in explorer NOT FLOATING
- `gb` go to buffers

- `t` when in tree select the file and hit `t` to open it in new tab
- `e` or `enter` to open
- `E` open file in vertical split
- `s` open file in split
- `a` add a file
- `A` add a dir
- `r` rename
- `yp` yank file path
- `yn` yank file name
- `yy` yank files
- `p` paste file
- `df` delete file
- `f` fuzzy finder
- `[c` and `]c` git changed files hops
- `<<` stage a file
- `>>` unstage a file

## FZF, Ripgrep, Universal-ctags, Silver-searcher

For more info [see](https://www.chrisatmachine.com/Neovim/08-fzf/)

First install linux packages:

```bash
  sudo apt install fzf ripgrep universal-ctags silversearcher-ag fd-find
```

### FZF

Fuzzy file finder (Ctrl+p on steroids)

- `:FZF` to show the fuzzy finder
- `Ctrl+f` opens fuzzy finder with preview, ignores files that git ignores
- `:GFile` file search for git files
- `:File` file search
- `\t` opens fzf for tags
- `\b` opens fzf for buffers
- `\m` opens fzf for markers
- `:Lines` search for string in loaded buffers
- `:BLines` search for string in current buffer

When the FZF window is open then press:

- `Enter` to open the file in buffer
- `Ctrl+t` to open the file in new tab
- `Ctrl+x` to open the file in horizontal split |
- `Ctrl+v` to open the file in vertical split -

### RipGrep

Searches all files for a string; Global string search

- `\g` opens ripGrep finder

When repGrep search is opened user:

- `Enter` to select the match
- `Alt+A` to select all matches
- `Alt+D` to deselect all matches

## NerdCommenter

Comment out code with: `<leader>+/`.
`<leader>` is `\`

## LightLine

Lightline is a action line

## Neard Fonts

Font with icons :)
install them from: `https://www.nerdfonts.com/`
and unzip the fonts in `~/.local/share/fonts`

## Which key

Used to show all key binds (action) for leader key, in my case `\`.
When you press the leader key a menu will show with all available actions.

## Rainbow

Rainbow brackets.

## Stratify

Show welcome screen on start.
Can save sessions.
Can pin files as bookmarks.

The session are available in command mode, the commands start with 'S'.

- `SSave` save session
- `SLoad` load session
- `SDelete`
- `SClose`

## [Projectionist](https://github.com/tpope/vim-projectionist)

Switching between alternating files like in angular ts, html.
Create a 'projections.json' file and in there you define your navigation.

```projections.json
{
  "src/app/*.ts": {"alternate": "src/app/{}.html"},
  "src/app/*.html": {"alternate": "src/app/{}.ts"},
  "src/app/*.service.ts": {"type": "service"}
}
```

First two lines are to alternate between ts and html in angular.
The third line defines a type 'service' for easier service finding.

- `:A` to alternate files
- `:E{type_name}` to go to file type; ex `:Eservice auth` open auth.service.ts

## Ranger

File manager, stand alone application.

install `sudo apt install ranger`

---

## GIT

## Signify

Show's git gutter. If the lines are changed.

commands:

- `:SignifyToggle` toggle symbols in gutter
- `:SignifyToggleHighlight` toggle line color
- `:SignifyDiff` open file diff changes in separate tab
- `\j` go to next git change
- `\k` go to previous git change
- `\e` show current diff line change
- `\E` undo current diff line change

## Fugitive

In git conflict go to unstaged file and press `dv` to open git conflict resolver.
In git conflict resolver press `\gj` for the right side or `\gf` for the left side.

- `Gdiffsplit HEAD^` show file change of the previous commit
- `Gdiff :0` show diff between current changes (SCREEN UP ARE NEW CHANGES)
- `Gdiff ~3` show diff of tree commits behind
- `Glogs` shows the list of commits and the diff files

## GitBlame

Use leader B to see the blame in the vim status.

TODO: see lazy git it's a git client in terminal
maybe tpope dispacher to run async commands in vim's terminal tip 10
