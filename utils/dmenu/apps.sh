#!/bin/bash
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


MSG="(⌐▨_▨) app: "
OPT=(
"authy"
"firefox"
"teams"
"skypeforlinux"
"slack"
"flameshot"
"nautilus"
"kitty"
"alacritty"
"blueman-applet"
"drawio"
"chromium"
)

CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -p "$MSG")

$CHOICE

exit 0
