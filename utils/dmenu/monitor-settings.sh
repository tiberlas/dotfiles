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
# change the monitor and wallpaper config

# if not shore just run `xrandr` to see the available ports
# for --pos flaf see: https://superuser.com/questions/485120/how-do-i-align-the-bottom-edges-of-two-monitors-with-xrandr
# ports for lenovo L15 laptop
LAPTOP="eDP-1"
HDMI="HDMI-1"

GIRLS_WALLPAPER=~/pictures/pastel-girls
RETRO_WALLPAPERS=~/pictures/retro2D
EYE_WALLPAPERS=~/pictures/eye-wallpaper
DARK_WALLPAPERS=~/pictures/dark-wallpaper
MINECRAFT_WALLPAPERS=~/pictures/minecraft-wallpaper

MSG="Choose monitor setup: "
OPT=(
"laptop"
"hdmi+laptop"
"duplicate"
"hdmi"
"rotaded left hdmi"
"rotate normal hdmi"
"refresh wallpaper"
)
CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -l 5 -p "$MSG")

case $CHOICE in
  ${OPT[0]})
    xrandr --output $LAPTOP --mode 1920x1080 --output $HDMI --off
    ;;
  ${OPT[1]})
    xrandr --output $LAPTOP --mode 1920x1080 --pos 1920x0 --primary --output $HDMI --mode 1920x1080
    ;;
  ${OPT[2]})
    xrandr --output $LAPTOP --mode 1920x1080 --output $HDMI --same-as $LAPTOP
    ;;
  ${OPT[3]})
    xrandr --output $LAPTOP --off --output $HDMI --mode 1920x1080 --primary
    ;;
  ${OPT[4]})
    xrandr --output $LAPTOP --off --output $HDMI --mode 1920x1080 --primary --rotate left
    ;;
  ${OPT[4]})
    xrandr --output $LAPTOP --off --output $HDMI --mode 1920x1080 --primary --rotate normal
    ;;
  ${OPT[6]})
    nitrogen --set-zoom --set-color=#000 --random ${RETRO_WALLPAPERS} --head=0 &&
    nitrogen --set-zoom --set-color=#000 --random "${RETRO_WALLPAPERS}" --head=1 &&
    nitrogen --set-centered --set-color=#000 --random "${RETRO_WALLPAPERS}" --head=2
    ;;
  *)
    printf "%s" "command not implemented T_T"
    ;;
esac

exit 0

