# DOTFIELS

## clone

clone as bare repo: `git clone --bare https://github.com/tiberlas/dotfiles.git`

## usage

Created an alisa **dot**: `/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME`  
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

## setup replication on clean Arch install

Install arch with `archinstall` and set the profile to *xorg* (no desktop env just the basic X11)  

After reboot log into the newly createt system and run:  
```bash
# update the packet manager
sudo pacman -Sc
sudo pacman -Syyu
# base apps
sudo pacman -Sy neovim kitty fish git lsd ranger dmenu
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
#network
sudo pacman -S networkmanager network-manager-applet
sudo systemctl start NettworkManager.service
# sound
sudo pacman -S alsa-utils alsa-oss
sudo pacman -S alsamixer alsa-plugin
# dots
git clone --bare https://github.com/tiberlas/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dot fetch
dot restore --staged .
dot restore Templates Pictures Public .dmenu .config README.md
```

