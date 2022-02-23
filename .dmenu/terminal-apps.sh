################################################################################
#                                           
#  _    _   _ _               _             author: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     change screen settings
# | __|| __| | '_ \ / _ \ '__| | | | / __|    
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
#                                             
################################################################################

#!/bin/bash

MSG="(⌐▨_▨) app: "
OPT=(
"ranger"
"htop"
"lazygit"
"tty-clock"
"neofetch"
"levi9"
)

CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -p "$MSG")

case $CHOICE in
  ${OPT[0]})
    alacritty -e ranger
  ;;
  ${OPT[1]})
    alacritty -e htop
  ;;
  ${OPT[2]})
    alacritty -e lazygit
  ;;
  ${OPT[3]})
    alacritty -e tty-clock -scbx -C 6 -f \"%a, %d %b %Y %T\"
  ;;
  ${OPT[4]})
    alacritty -e $(neofetch --ascii_bold on --ascii_distro Xubuntu --color_blocks off --bold on --package_managers off --cpu_temp on --refresh_rate on && while [ : ]; do sleep 1; done)
  ;;
  ${OPT[5]})
    authy || flameshot
  ;;
esac

exit 0
