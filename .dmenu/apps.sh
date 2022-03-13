################################################################################
#                                           
#  _    _   _ _               _             author: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     commonlly used apps
# | __|| __| | '_ \ / _ \ '__| | | | / __|    
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
#                                             
################################################################################

#!/bin/bash

MSG="(⌐▨_▨) app: "
OPT=(
"slack"
"skypeforlinux"
"authy"
"brave-browser"
"firefox"
"gimp"
"flameshot"
"nautilus"
"teams-for-linux"
"kitty"
"blueman-applet"
)

CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -p "$MSG")

$CHOICE

exit 0
