# DOTFIELS

## clone

clone as bare repo: `git clone --bare https://github.com/tiberlas/dotfiles.git`

## usage

Created an alisa **dot**: `/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME`  
Instead of `git` write `dot` in terminal.

```bash
dot status
dot add .config/kitty
dot commit -m '[kitty] changed what ¯\_(ツ)_/¯'
dot push
```

**MUST ADD FILES MANUALY**
**DO NOT USE ADD --ALL**

### Commit naming

Message must start with which config did it affect; like in the example above

## how it works's

We created an git bare repo called *dotfiles*  
In $HOME a *dotfiles* folder is created  When you add a file (stage it) it's copied to $HOME/dotfiles folder  

## setup replication on clean Arch install

Install arch with `archinstall` and set the profile to *xorg* (no desktop env just the basic X11)  
Boot into arch install and run:
```bash
pacman -Syyu
pacman -S archinstall
archinstall
```
> select your mirrors, select drivers, format them
> create user and select to be sudo
> xorg
> network: just copy the config from installation drive
```bash
reboot

# see 'https://wiki.archlinux.org/title/Xorg#Driver_installation' for video drivers
sudo pacman -S xf86-video-intel xorg xorg-xinit nitrogen
sudo pacman -S base-devel
sudo pacman -S awesome xterm
sudo pacman -S vim firefox git
reboot
cp /etc/X11/xinit/xinitrc /home/tibi/.xinitrc
vim .xinitrc
```
> Delete the last 5 lines that are about twm; these lines are connected with &
> twm is the default wm of xorg; it's old and bad
> in the end of file add: `exec awesome`
```bash
mkdir -p ~/.config/awesome/
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/ # basic config
startx # starts the X graphic video system
```

After reboot log into the newly createt system and run:  
```bash

# update the packet manager
sudo pacman -Sc
sudo pacman -Syyu

# base apps
sudo pacman -Sy vim xclip neovim kitty git lsd ranger neofetch alacrity okular vlc
sudo pacman -Sy firefox chromium
sudo pacman -Sy picom # compositor

#fish shell
sudo pacman -Sy fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
# !!!fish should be installed with all plugins for node(nvm) run:
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
nvm install latest

#network
sudo pacman -S networkmanager network-manager-applet
sudo systemctl start NettworkManager.service # restart bash or reboot if not shown

# sound
sudo pacman -S alsa-utils alsa-oss
sudo pacman -S alsamixer alsa-plugin
# best to reboot
#to open mixer run: alsamixer
#if sound dosent work run: alsactl init

# font
# see: 'https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager'
sudo pacman -Sy ttf-fira-code ttf-firacode-nerd ttf-fira-mono ttf-fira-sans

# dots
git clone --bare https://github.com/tiberlas/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dot fetch
dot restore --staged .
dot restore Templates Pictures Public .dmenu .config README.md

# setup awesome wm: 
# start_up
# $HOME in rc.lua
# rc.lua remove streetturtle

# login manager
sudo pacman -Sy lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service
sudo vim /etc/lightdm/lightdm.conf
```

Now set the greeter that you have installed
```/etc/lightdm/lightdm.conf
...
[Seat:*]
...
greeter-session=lightdm-gtk-greeter
...
```

```bash

# screen saver
sudo pacman -Sy light-logger
# run: `light-logger` to start the service
# run: `light-logger-command -l` to lock the screen

# nvim
sudo pacman -Sy fzf ripgrep
# open nvim, install all dependencies; posibly remove theme and then install aall dependencies

# bluetooth
sudo systemctl enable bluetooth.service
sudo pacman -Sy bluez bluez-utils
bluetoothctl # to connect device

# yay
# dependencies
sudo pacman -Sy base-devel git
# go to aur packages dir and run
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R tiberius:users ./yay
cd yay
makepkg -si


# snap
# It seams that some packages I use are only available as snap. go to AUR folder and run:
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

sudo snap install authy

# ender
sudo pacman -Sy freecad
sudo snap install cura-slicer
#to execute run
cura-slicer.cura

# dmenu is patched from suckless
```

## Ubuntu clone

```bash
# virtual box guest driver

# install xfce
sudo apt install xubuntu-desktop
reboot
#install awesome and utilities
sudo apt-get install firefox vim git nitrogen compton awesome xterm fish neofetch pnmixer flameshot i3lock-fancy ranger fzf ripgrep lua5.4 pwgen redshift
sudo snap install authy --beta lsd
# dmenu
sudo apt install suckless-tools
#alacrity
sudo add-apt-repository ppa:aslatter/ppa
sudo apt install alacritty
#kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/
#install omf https://github.com/oh-my-fish/oh-my-fish
#neard font
cd .local/share/fonts
# url: https://github.com/ryanoasis/nerd-fonts#option-1-download-and-install-manually
reboot
git clone --bare https://github.com/tiberlas/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dot fetch
dot restore --staged .
dot restore Templates Pictures Public .dmenu .config README.md
#awesome
# comment out start-up apps in awesome
u rc.lua promeni variable HOME
# instaliraj streetturtle
mkdir streetturtle-widgets
cd streetturtle-widgets
git clone https://github.com/streetturtle/awesome-wm-widgets.git
#neovim
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
cd Public
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"
# enter to nvim and install all dependencies, comment out the theme
```

