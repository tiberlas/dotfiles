# VIM Cheat sheet

**LEADER CHANGED TO `,`**

In command mode (:) type '!' and then any shell command :)
`:!ls` run ls inside of vim

## Some useful mapped commands

- `gd` go to definition; show definition of function, class, etc
- `gf` go to file
- `Ctrl+o` go back through line history
- `Ctrl+6` go to previous Buffer
- `Ctrl+space` open auto complete in insert mode
- `Ctrl+space` open spell check in normal and visual mode
- `K` show tooltip (function definition)
- `\r` rename a fun, variable
- `gt` go to next Tab
- `gT` go to previous Tab
- `tab` open next buffer, `shift+tab` previously
- `\d` remove hlsearch
- `Ctrl+s` ~ wa
- `Ctrl+q` ~ qa!

## Basic Movements

- `^` ~ `0W`
- `e` go one word but end on word end

- `x` delete left char ~ `dl`
- `X` backspace
- `D` ~ `d$`
- `0D` delete all chars on line

- `.` repeat last command
- `,` undo last command

- `u` undo
- `Ctrl+r` redo

- `NUMBERg_` move NUMBER lines below and position the cursor on the line end

- `gj` and `gk` to move in wrap text!
- `g0` `g$` goes to begging and end of a wrapped line

## Registers

We have two types of registers numbered and named(one char)
Numbered are used for yank, delete actions; named for macros

- "" default, saves all
- "0 yank
- "1 delete
- "2 ... "9 history of yank and delete
- "c named reg c
- "C append to reg c
- `:reg` shows register content
- `:reg a` shows content of reg "a
- `"add` dd saved to reg "a
- `qa` record macro in reg "a
- `@a` play macro in reg "a

## Insert

- `A` insert on line end
- `I` insert on line beginning
- `J` join two line into one
- `80i*` we get a line of 80 *
- `s` ~ xi
- `r` replace one char
- `R` replace mode, eat hole line
- `c` change
- `C` ~ `c$`
- `~` change case
- `gUw` change to upper case
- `guw` change to lower case

## Search

- `f` forward char search
- `t` forward char before search
- `F`, `T` backward
- `;` repeat the last search
- `/` global file search; `n` next, `N` back
- `?` global reversed search
- `*` find all words under the cursor

To do a case insensitive search do:
`/\cSEARCH` the \c is for case insensitive and \C for case sensitive

## Replace substitute

- `:s/OLD/NEW` replace first OLD with NEW on the current line
- `:s/OLD/NEW/g` replace all OLD with NEW on the current line
- `:1,5s/OLD/NEW/g` replace on the first 5 lines all OLD with NEW
- in the range part (`1,5`) we can have:
  - `$` last line in file
  - `.` current line
  - `%` all lines (hole file) ~ `1,$`
  - `'<,'>` only selected lines (highlighted)

Analog with `g` but after is command

- `:g/SEARCH/COMMAND` like `:g/test/d` deletes 'test' in line

The search separator `/` can be replaced with: |, #, +, &
Change the search separator if the search separator is used in search string
The search separator must be constant in search

## Multy file search

*GREP*

For multi file search we use `vimgrep`. Note that *rg* is faster but I couldn't use it correctly.
All found matches are in quickfix list that can be open on: `:copen`.
There is a alias for this that opens the quickfix list:

- `:Grep /SEARCH/ PATH` ex `Grep /actions/ **/ats/**/*.ts` searches actions only it the specified path
- `:Grep /cSEARCH/ PATH` case insensitive SEARCH
- `:Grep /CSEARCH/ PATH` case sensitive SEARCH
- `:Grep /SEARCH/g PATH` global, matches multiple occurrences in the same line
- `:Grep /SEARCH/f PATH` fuzzy

## Replace in multiple files

1. Use `Grep` (see the previous heading) to populate the quickfix list.
2. `cdo s/OLD/NEW/` to replace all occurrences OLD with NEW in the quickfix list.

## Text objects

Smart operators that make coding easier
Use ACTION then a, i then movement/operator

- `daw` delete a word
- `dap` delete a paragraph
- `da[` delete a []
- `di{` delete in *{}, <>, '', "", ...*
- `daf` delete a tag
- `daf` delete a fun

## Visual Mode

Types of visual modes:

- `v` in line visual mode
- `V` line visual mode
- `Ctrl+v` visual block

Commands in visual modes

- `o` change selected end
- `u` lowercase
- `U` upperCase
- `>` indent right
- `<` indent left
- `~` switch case

for this action and below the change on all selected lines will be viseible after `esc`

- `A` append
- `I` insert
- `C` change
- `J` join lines

## Buffers

- `tab` switch buffer
- `Shift+tab` previous buffer
- `Ctrl+o` next buffer
- `Ctrl+i` previous buffer
- `Ctrl+6` previous buffer switch

- `:ls` list buffers
- `:bn` next buffer
- `:bp` previous buffer
- `:bf` first buffer
- `:bl` last buffer
- `:bd` delete current buffer
- `:bonly` close all buffers accept the current
- `ba` open all buffers in windows
- `:e FILE_NAME` open file

## Tabs

- `:tabnew` open blank file in tab
- `:tabedit FILE_NAME`
- `:tabnext` `gt`
- `:tabprev` `gT`
- `:tabonly` close all tabs accept the current
- `:tab split` open split in tab

## Window (pains)

- `Ctrl+w s` window split
- `Ctrl+w v` vertical split
- `Ctrl+w q` quit
- `Ctrl+w o` close all accept the current
- `Ctrl+w K` set window to full width (split horizontal)
- `Ctrl+w H` set window to full height (split vertical)
- `Alt+h,j,k,l` window resize
- `Ctrl+h,j,k,l` window navigation
- `Ctrl+w r` rotate
- `<leader>th` `<leader>tl` switch pains

## quick fix list

QuickFix List is an array of files with specific locations
Two types of list:

- local the scope is on the current buffer
- global the scope is the entire project

commands:

- `copen` open the quickFixList
- `cclose` close the quickFixList
- `cnext`
- `cprev`

# Advanced

## mapped commands

- `gq` format line to 80 chars
- `zv` open folds in text

## useful commands

- `:tabnew %` opens the current buffer in new tab
- `<leader>w` close all buffers except the current one
- `:WindowFull` maximize the current window
- `Ctrl+W =` make all windows equal size

## tab/space formatting

command functions are defined *ConvertToTabs* and *ConvertToSpaces*
- set the indent size with: `: set tabstop=4`
- convert spaces to tabs; when converting spaces to tabs *you must first set the indent*

## git flow

see git logs
- use `g-i` in bash
- `Gclog HEAD...origin/BRANCH` show the difference between local and origin

To review changes before committing
- `:Git`  shows all changed files
- `Alt+j`  make the git window smaller
- in git window hover on file and press `dv` to see the diff
- you don't need to close any buffer when you want to view another file just go to the git window and preview the new file
- to stage a file press `s` or `S` to stage all files
- fugitive mappings:
- - `cc`  Create a commit.
- - `ca`  Amend the last commit and edit the message.
- - `ce`  Amend the last commit without editing the message.

## format json

- select the json txt
- run `'<,'>!python3 -m json.tool`

## looking at git diff file

in vertical view open `Git log` to see the commits
Go TO file and go back in history `Gdiffsplit HEAD~X`
Upper diff screen should be the head (current changes) but you can always see in the status line the git hash

## file history

open a file, then use `0Gclog` to view all commits that have affected that file
**In the status line is written witch commit is shown**
You can select a commit and the file will change to view the file in that commit

To view changes (diff) first select a starting commit
If you want to see the diff of the current status use `Gedit` to show the current file
Then use `Gdiffsplit HASH` where the HASH is the git commit HASH

