################################################################################
#                                           
#  _    _   _ _               _             author: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     my aliases for bash shell
# | __|| __| | '_ \ / _ \ '__| | | | / __|    
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
#                                             
################################################################################

alias g-la='git log --graph --oneline'
alias g-ll='git log -n 10 --graph --oneline'
alias g-s='git status'
alias g-i='git status && git log -n 10 --graph --oneline'
alias g-a='git add --all'
alias g-r='git reset HEAD^'
alias g-rh='git reset --hard HEAD^'
alias g-rs='git reset --soft HEAD^'

alias awsin='aws sso login --profile factor-dev-profile'
alias awsout='aws sso logout'

alias factor='clear && npm run serve --profile=factor-dev-profile --env=dev'
