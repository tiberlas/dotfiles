fish_vi_key_bindings

# abbriviations

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
abbr -a t-sh "cp ~/Templates/new.sh new.sh"
abbr -a t-curl "cp ~/Templates/curl.sh new.sh"

abbr -a dir-pop "cd \$(xclip -selection c -o)"
abbr -a dir-push "pwd | xclip -selection c"
abbr -a getclip "xclip -selection c -o"
abbr -a setclip "xclip -selection c"

# alias

alias deno=/home/t.tapai/.deno/bin/deno
alias dot='/usr/bin/git --git-dir=/home/t.tapai/dotfiles/ --work-tree=/home/t.tapai'
alias kitty-cat=./.local/kitty.app/bin/kitty
alias neo='~/Desktop/./neovide'

alias g-pass='pwgen -ysBv 17 1'
alias pass='bash ~/Public/my-scripts/generate-password.sh'

# function

function go
    clear && cd $argv && lsd -la
end
