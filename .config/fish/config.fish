fish_vi_key_bindings

# abbriviations

abbr -a n-l "bash ~/utils/bash-scripts/nvim-light.sh"
abbr -a n-nb "bash ~/utils/bash-scripts/nvim-nb.sh"
abbr -a n-d "bash ~/utils/bash-scripts/nvim-debugger.sh"
abbr -a n-r "bash ~/utils/bash-scripts/nvim-reader.sh"
abbr -a n-t "bash ~/utils/bash-scripts/nvim-test.sh"

abbr -a ls lsd -la
abbr -a dira "tree -aL 2"
abbr -a L "&& lsd -la"

abbr -a g-a "git add --all"
abbr -a g-c "git commit -m 'PL-'"
abbr -a g-ch "git checkout"
abbr -a g-diff "git diff HEAD{'^',}"
abbr -a g-i "git status && git log --graph --oneline -n 12"
abbr -a g-l2 "git log -n 2"
abbr -a g-la "git log --graph --oneline"
abbr -a g-ll "git log -n 10 --graph --oneline"
abbr -a g-p "git push"
abbr -a g-r "git reset HEAD^"
abbr -a g-rh "git reset --hard HEAD^"
abbr -a g-rs "git reset --soft HEAD^"
abbr -a g-s "git status"
abbr -a g-f "git fetch origin"

abbr -a awsin "aws sso login --profile factor-dev-profile"
abbr -a open "mimeopen -d"
abbr -a r-off "redshift -O 6500K"
abbr -a r-on "redshift -O 5000K"
abbr -a clock "tty-clock -scbx -C 6 -f \"%a, %d %b %Y %T\""
abbr -a n "nvim ."
abbr -a v "vim ."
abbr -a t-sh "cp ~/Templates/newShellScript.sh new.sh"
abbr -a t-curl "cp ~/Templates/curl.sh new.sh"
abbr -a t-lua "cp ~/Templates/newLua.lua new.lua"

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
abbr -a d-p "dot push origin "
abbr -a d-d "dot diff HEAD{'^',}"

abbr -a b-push "bash ~/utils/bash-scripts/back-up-push.sh"
abbr -a b-fetch "bash ~/utils/bash-scripts/back-up-pull.sh"

# alias

alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v (pwd):/aws amazon/aws-cli'
alias deno=$HOME/.deno/bin/deno
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'

alias g-pass='pwgen -ysBv 17 1'
alias pass='bash ~/utils/bash-scripts/generate-password.sh'

# function

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
