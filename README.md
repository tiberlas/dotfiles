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

## setup replication

After instale a bare arch linux distro run these commands:

Set the mirror to hungarian servers  
Go to '/etc/pacman.d/mirrorlist' and paste the list from 'https://archlinux.org/mirrorlist/'

```bash
sudo pacman -Sc
sudo pacman -Syyu
# if not installed awesomewm install it with it's dependencies
sudo pacman -S lightdm xorg-server awesome xterm dmenu nitrogen compton
# basic apps
sudo pacman -S vim neovim kitty firefox ranger lsd git
# fish terminal emulator
sudo pacman -S fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
# network manager
sudo pacman -S networkmanager network-manager-applet
sudo systemctl start NettworkManager.service
nm-applet # start network manager applet; enable it in start up awesome
# sound
sudo pacman -S alsa-utils alsa-oss
sudo pacman -S alsamixer alsa-plugin
# cloning my dot files
sudo pacman -S git
git clone --bare https://github.com/tiberlas/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

