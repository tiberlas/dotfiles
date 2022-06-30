# VIM CONFIG

In this document are described plugins for neovim.
In [commands](/commands.md)  are described basic vim commands and some advanced flows.
When changing a config file to you have to source it, you can use: `source %` where % is the current buffer

## mapings

- `gj` goto 25 lines below
- `gk` goto 25 lines above

## VimPlug

For plugins use a plugin manager **vim-plug**: `https://github.com/junegunn/vim-plug`
Plugins are installed in **plugins file** thats located *~/.config/nvim/vim-plug/plugins.vim*

useful commands:

- `:PlugStatus` check status of your plugins
- `:PlugInstall` install all defined plugins from **plugins file**
- `:PlugUpdate` updates the installed plugins
- `:PlugClean` to remove plugins that have been removed from the **plugins file**
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

### Coc-prettier

- `:Prettier` format current buffer

### Coc-snippets

ads custom defined snippets and some are pre defined

`CocList snippets` show all snippets

In insert mode pres `Ctrl-space` and the snippets has [s] at the end of the list.
When the list is open use:

- `Ctrl-k` move up
- `Ctrl-j` mode down
- `Ctrl-l` use the selected snippet

When the snippet template is generate you can move through the placeholders with `Ctrl-j` and `Ctrl-k`.

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

## NerdCommenter

Comment out code with: `<leader>+/`.
`<leader>` is `\`

## LightLine

Lightline is a action line

## Neard Fonts

Font with icons :)
install them from: `https://www.nerdfonts.com/`
and unzip the fonts in `~/.local/share/fonts`

## Rainbow

Rainbow brackets.

## Startify

Show welcome screen on start.
Can save sessions.
Can pin files as bookmarks.

The session are available in command mode, the commands start with 'S'.

- `Startify` open startify menu
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

## Floaterm

- `leader+t t` toggle floating terminal
- `leader+t n` new floating terminal
- `leader+t j` next floating terminal
- `leader+t k` prev floating terminal
- `leadet+t g` lazygit
- `leadet+t r` ranger

to close pres `leader+t t` or `Ctrl+D` basically ending the process


## Surround

Surround txt with quotes, brackets, tags, ...
No config

- ys+MOTION+SURROUND adds surround to the selected motion
- on word HELLO do ysaw" resold "HELLO"
- cs+OLD_SURROUND+NEW_SURROUND replace the surround
- ds+SURROUND removes the surround

- ysaw<div> surround *a word* with <div> tag
- dst deletes the tag surround

- in visual line (V) press S+SURROUND to surround the selected lines

for more info see *https://github.com/tpope/vim-surround*

## Telescope

Fuzzy finder

bindings:

- `<leader>ff` file finder
- `<leader>fb` buffers
- `<leader>fg` grep

Default mappings in open telescope:

- <C-n>  <C-p> next | previous
- <Down> <Up>  next | previous
- j      k     next | previous (in normal mode, press ESC to enter normal mode, i for insert mode)
- <CR>         go to file selection

- <C-x>        go to file selection as a split
- <C-v>        go to file selection as a vertical split
- <C-t>        go to a file in a new tab

- <C-u>        scroll up in preview window
- <C-d>        scroll down in preview window

- <C-c>        close telescope
- <Esc>        close telescope (in normal mode)

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

In confict file run: `Gvdiffsplit!` for 3 way vertical split or `Gdiffsplit!` for 3 way horizontal split or
In git conflict go to unstaged file and press `dv` to open git conflict resolver.
In git conflict resolver press `leader+gj` for the right side (new changes) or `leader+gf` for the left side (current changes).

**in Gdiffsplit the file with R0 is the old file**

- `Gdiffsplit HEAD^` show file change of the previous commit **the work tree version is always placed to the right or bottom**
- `Gdiff :0` show diff between current changes (SCREEN UP ARE NEW CHANGES)
- `Gdiff HEAD~3` show diff of tree commits behind
- `diffupdate` to refresh the diff view
- `0Gclog` view **file history**
- `Glog` shows the list of commits and the diff files
- `Gclog` show logs and above the diff
- `Gclog -n 10` shows only 10 commits so you can add any git modificator
- `Gclog -- %` SHOWS COMMITS THAT HAVE AFFECTED THE CURRENT BUFFER

- `Git show --pretty="" --name-only HEAD~0` show affected files from the latest commit, to open a file use `gf` goto file

- `Gedit` go to working copy
- `Git add %` stages the current buffer, the '%' is the current buffer
- `Gwrite` does the same sa above
- `Git checkout %` revert the unstaged file, the current buffer
- `Gread` empty the buffer and reverte the current buffer (only the unstaged changes)
- `Gcommit` create a commit
- `Gblame` or `Git blame` creates a vertical split

- `Gstatus` or `Git` shows status
- - `enter` open the file; goot combination with `Gdiff` to review changes
- - `s` to stage
- - `u` to unstage
- - `X` discart unstaged changes

Abbr (use space to unfold them)

- `g-l` log graph
- `g-f` file changes in last commit
- `g-d` diff for *current* changes (unstaged changes)

# TODO

high priority:

- add a lib for custom functions
- make git abbr more user friendly
- fix neo-tree plugin
- fix CocExplorer, the theme is off
- Configure Telescope to delete a buffer
- Configure Telescope to run proper **grep**
- quick fix list

low priority:

- rewrite config to lua
- see lazy git it's a git client in terminal
- tpope dispacher to run async commands in vim's terminal tip 10

