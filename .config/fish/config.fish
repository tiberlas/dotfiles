# EXPORTS
export VISUAL=vim
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.config/emacs/bin:$HOME/.nvm:$PATH"

# use for OLL platfirm's smart-card reader wheel package
export PKG_CONFIG_PATH="/usr/lib/pkgconfig"

# BREW
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

fish_vi_key_bindings

# NVM config (https://github.com/brigand/fast-nvm-fish) [
# just run `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && bash "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ]

# abbriviations

abbr -a v "vim ."
abbr -a n "nvim"
# legacy neovim configs; not configured
abbr -a n-d "bash ~/utils/bash-scripts/nvim-doom.sh"
abbr -a n-l "bash ~/utils/bash-scripts/nvim-light.sh"
abbr -a n-nb "bash ~/utils/bash-scripts/nvim-nb.sh"
abbr -a n-dd "bash ~/utils/bash-scripts/nvim-debugger.sh"
abbr -a n-r "bash ~/utils/bash-scripts/nvim-reader.sh"
abbr -a n-t "bash ~/utils/bash-scripts/nvim-test.sh"
abbr -a n-i "bash ~/utils/bash-scripts/nvim-immortal.sh"
abbr -a n-legacy "bash ~/utils/bash-scripts/nvim-legacy.sh ."

abbr -a ls "tree -ahpug -L 1"
abbr -a dir "tree -ahp -L 2"

abbr -a g-a "git add --all"
abbr -a g-c "git commit -m 'ATS-'"
abbr -a g-ch "git checkout"
abbr -a g-diff "git diff HEAD{'^',}"
abbr -a g-l "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' -n 15"
abbr -a g-la "git log --graph --abbrev-commit --decorate --all --source --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset) [%C(red)%S%C(reset)] %C(auto)%d%C(reset)'"
abbr -a g-i "git status && git log --graph --oneline -n 12"
abbr -a g-p "git push origin "
abbr -a g-r "git rebase -i HEAD~5"
abbr -a g-rh "git reset --hard origin/"
abbr -a g-rs "git reset --soft HEAD^ && git restore --staged ."
abbr -a g-s "git status"
abbr -a g-f "git fetch --prune"
abbr -a g-set-lr "git config --local user.name Tibor Tapai && git config --local user.email tibor.tapai@tibor.tapai0722mac"
abbr -a g-set-oll "git config --local user.name Tibor Tapai && git config --local user.email ttapai@openlawlib.org"

abbr -a usb-m "sudo mount -o umask=000,uid=t2api,gid=t2api /dev/sdd1 /mnt/thumb-drive"
abbr -a usb-u "sudo umount /dev/sdd1 /mnt/thumb-drive"

# PROFESSIONAL USE
abbr -a oll-py-taf "source /mnt/md0/workspace/oll/venvs-taf/venv10/bin/activate.fish"
abbr -a oll-py-tuf "source /mnt/md0/workspace/oll/venvs-tuf/venv10/bin/activate.fish"
abbr -a oll-py-am "source /mnt/md0/workspace/oll/venvs-amend-process/venv10/bin/activate.fish"
abbr -a oll-py-pla "source /mnt/md0/workspace/oll/venvs-platform/venv10/bin/activate.fish"
abbr -a oll-py-doc6 "source /mnt/md0/workspace/oll/venvs-py-docx/venv6/bin/activate.fish"
abbr -a oll-py-doc7 "source /mnt/md0/workspace/oll/venvs-py-docx/venv7/bin/activate.fish"
abbr -a oll-py-doc8 "source /mnt/md0/workspace/oll/venvs-py-docx/venv8/bin/activate.fish"
abbr -a oll-py-doc9 "source /mnt/md0/workspace/oll/venvs-py-docx/venv9/bin/activate.fish"
abbr -a oll-py-doc10 "source /mnt/md0/workspace/oll/venvs-py-docx/venv10/bin/activate.fish"
abbr -a oll-py-doc11 "source /mnt/md0/workspace/oll/venvs-py-docx/venv11/bin/activate.fish"
abbr -a oll-test "oll tests run -i core"

abbr -a open "mimeopen -d"
abbr -a clock "tty-clock -scbx -C 6 -f \"%a, %d %b %Y %T\""
abbr -a word "libreoffice"

abbr -a dir-pop "cd \$(xclip -selection c -o)"
abbr -a dir-push "pwd | xclip -selection c"

abbr -a getclip "xclip -selection c -o"
abbr -a setclip "xclip -selection c"

abbr -a d-i "dot status -uno"
abbr -a d-s "dot status"
abbr -a d-l "dot log --graph --oneline -n 8"
abbr -a d-ch "dot checkout"
abbr -a d-f "dot fetch"
abbr -a d-m "dot merge"
abbr -a d-a "dot add"
abbr -a d-c "dot commit"
abbr -a d-b "dot branch"
abbr -a d-p "dot push"
abbr -a d-d "dot diff HEAD{'^',}"

abbr -a b-all-pull "bash ~/utils/bash-scripts/back-up-pull.sh"
abbr -a b-all-push "bash ~/utils/bash-scripts/back-up-push.sh"
abbr -a b-pull "bash ~/utils/bash-scripts/back-up-pull-no-ender.sh"
abbr -a b-push "bash ~/utils/bash-scripts/back-up-push-no-ender.sh"

abbr -a g-pass 'bash ~/utils/bash-scripts/generate-password.sh'

# alias
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
alias brew='/home/linuxbrew/.linuxbrew/bin/brew'

# short hands and type fixes
alias py='python3'
alias py-t='pytest -svv'
alias dc="cd"
alias gti="git"
alias sl="tree -ahpug -L 1"

# TODO: create shell comands go, and back to impement cd with back btn;
# create a lua fun as a FIFO stack to store the paths

function go
	pwd > $HOME/.config/fish/previous_dir.txt
	clear
	cd $argv
	ll
end

function back
	PREV_DIR=cat $HOME/.config/fish/previous_dir.txt
	cd $PREV_DIR
	clear
	ll
end
#nvm use 20.11.0
