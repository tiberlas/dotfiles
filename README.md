# DOTFIELS

## usage

Created an alisa **dot**: `/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME`  
Instead of `git` write `dot` in terminal.

```bash
dot status
dot add .config/kitty
dot commit -m '[kitty] changed what :{'
dot push
```

**MUST ADD FILES MANUALY**
**DO NOT USE ADD --ALL**

### Commit naming

Message must start with which config did it affect; like in the example above

## how it works's

We created an git bare repo called *dotfiles*  
In $HOME a *dotfiles* folder is created  
When you add a file (stage it) it'c copied to $HOME/dotfiles folder  

