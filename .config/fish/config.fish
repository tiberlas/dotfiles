# EXPORTS
export VISUAL=vim
export PATH="$HOME/.local/bin:$PATH"

# use for testing Prebid.js
export CHROME_BIN="/usr/bin/chromium"

fish_vi_key_bindings

# NVM config (https://github.com/brigand/fast-nvm-fish) [
# just run `curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash`
export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ]

# PYENV
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# abbriviations

abbr -a v "vim ."
abbr -a n "bash ~/utils/bash-scripts/nvim-immortal.sh"
abbr -a n-d "bash ~/utils/bash-scripts/nvim-doom.sh"
abbr -a n-l "bash ~/utils/bash-scripts/nvim-light.sh"
abbr -a n-nb "bash ~/utils/bash-scripts/nvim-nb.sh"
abbr -a n-dd "bash ~/utils/bash-scripts/nvim-debugger.sh"
abbr -a n-r "bash ~/utils/bash-scripts/nvim-reader.sh"
abbr -a n-t "bash ~/utils/bash-scripts/nvim-test.sh"
abbr -a n-i "bash ~/utils/bash-scripts/nvim-immortal.sh"
abbr -a n-legacy "bash ~/utils/bash-scripts/nvim-legacy.sh ."

abbr -a ls lsd -la
abbr -a dir "tree -aL 2"
abbr -a L "&& lsd -la"

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
abbr -a g-ssh "eval (ssh-agent -c) && ssh-add ~/.ssh/id_ed25519"
abbr -a g-set-lr "git config --local user.name Tibor Tapai && git config --local user.email tibor.tapai@tibor.tapai0722mac"
abbr -a g-set-oll "git config --local user.name Tibor Tapai && git config --local user.email ttapai@openlawlib.org"

# PROFESSIONAL USE
abbr -a aws-lr "aws sso login --profile fktr-dev --no-browser"
abbr -a oll-py-pla "source ~/documents/workspace/open-law-lib/py10/venv/bin/activate.fish"
abbr -a oll-py-doc6 "source ~/documents/workspace/open-law-lib/py6-py-docx/venv/bin/activate.fish"
abbr -a oll-py-doc7 "source ~/documents/workspace/open-law-lib/venv-py-docx/venv7/bin/activate.fish"
abbr -a oll-py-doc8 "source ~/documents/workspace/open-law-lib/venv-py-docx/venv8/bin/activate.fish"
abbr -a oll-py-doc9 "source ~/documents/workspace/open-law-lib/venv-py-docx/venv9/bin/activate.fish"
abbr -a oll-py-doc10 "source ~/documents/workspace/open-law-lib/venv-py-docx/venv10/bin/activate.fish"
abbr -a oll-py-doc11 "source ~/documents/workspace/open-law-lib/venv-py-docx/venv11/bin/activate.fish"
abbr -a oll-test "oll tests run -i core"
abbr -a oll-install "pip install -e . -v"

abbr -a open "mimeopen -d"
abbr -a r-off "redshift -O 6500K"
abbr -a r-on "redshift -O 5000K"
abbr -a clock "tty-clock -scbx -C 6 -f \"%a, %d %b %Y %T\""
abbr -a no-touch "xinput set-prop 11 316 0"

abbr -a dir-pop "cd \$(xclip -selection c -o)"
abbr -a dir-push "pwd | xclip -selection c"

abbr -a getclip "xclip -selection c -o"
abbr -a setclip "xclip -selection c"

abbr -a usb-ll "sudo fdisk -l"
abbr -a usb-m "sudo mount -o umask=000,uid=$USER,gid=$USER /dev/sda1 /mnt/thumb-drive"
abbr -a usb-u "sudo umount /dev/sda1 /mnt/thumb-drive"

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

# short hands and type fixes
alias py='python3'
alias py-t='pytest -svv'
alias dc="cd"
alias gti="git"

# function TODO

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
