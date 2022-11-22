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
In $HOME a *dotfiles* folder is created  
When you add a file (stage it) it's copied to $HOME/dotfiles folder  

## setup replication on clean Arch install

Install arch with `archinstall` and set the profile to *xorg* (no desktop env just the basic X11)  

After reboot log into the newly createt system and run:  
```bash
# update the packet manager
sudo pacman -Sc
sudo pacman -Syyu
# base apps
sudo pacman -Sy neovim kitty fish git lsd ranger dmenu neofetch
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

