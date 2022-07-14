################################################################################
#                                           
#  _    _   _ _               _             author: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     zsh config
# | __|| __| | '_ \ / _ \ '__| | | | / __|    
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
#                                             
################################################################################

# Path to your oh-my-zsh installation.
export ZSH="/home/t.tapai/.oh-my-zsh"
export LESS=-"FRSX"

# NVM setup
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="strug"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# !!!the zsh-abbr plug must be last!!!
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-abbr)

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOT=true
MODE_INDICATOR="%F{white}normal%f"
INSERT_MODE_INDICATOR="%F{blue}insert%f"

source $ZSH/oh-my-zsh.sh

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ll="lsd -l"
alias la="lsd -la"

alias -g L="&& lsd -la"
alias -g neo="~/Desktop/./neovide"
alias -g dot="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias -g deno="/home/t.tapai/.deno/bin/deno"
alias -g kitty-cat="./.local/kitty.app/bin/kitty"

alias g-pass="pwgen -ysBv 17 1"
alias pass="bash ~/Public/my-scripts/generate-password.sh"

# some of my abbr
#abbr -g awsin="aws sso login --profile factor-dev-profile"
#abbr -g dira="tree -aL 2"
#abbr -g g-a="git add --all"
#abbr -g g-c="git commit -m 'CNSL-'"
#abbr -g g-ch="git checkout"
#abbr -g g-diff="git diff HEAD{'^',}"
#abbr -g g-i="git status && git log --graph --oneline -n 12"
#abbr -g g-l2="git log -n 2"
#abbr -g g-la="git log --graph --oneline"
#abbr -g g-ll="git log -n 10 --graph --oneline"
#abbr -g g-p="git push"
#abbr -g g-r="git reset HEAD^"
#abbr -g g-rh="git reset --hard HEAD^"
#abbr -g g-rs="git reset --soft HEAD^"
#abbr -g g-s="git status"
#abbr -g open="mimeopen -d"
#abbr -g r-off="redshift -O 6500K"
#abbr -g r-on="redshift -O 5000K"
#abbr -g clock="tty-clock -scbx -C 6 -f \"%a, %d %b %Y %T\""
#abbr -g dir-pop="cd \$(xclip -selection c -o)"
#abbr -g dir-push="pwd | xclip -selection c"
#abbr -g getclip="xclip -selection c -o"
#abbr -g g-f="git fetch origin"
#abbr -g npm-lr="npm run serve --profile=factor-dev-profile --env="
#abbr -g rig="neofetch --ascii_bold on --ascii_distro Xubuntu --color_blocks off --bold on --package_managers off --cpu_temp on --refresh_rate on"
#abbr -g setclip="xclip -selection c"
#abbr -g t-curl="cp ~/Templates/curl.sh new.sh"br -g g-la="git log --graph --oneline"

# My custom functions
go() {
    cd $1 && ll
}

