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
"authy"
"chromium"
"firefox"
"vlc"
"freecad"
"cura-slicer.cura"
"gimp"
"flameshot"
"kitty"
"alacritty"
"blueman-applet"
"drawio"
"virtualbox"
)

CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -p "$MSG")

$CHOICE

exit 0
