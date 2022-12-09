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
# ports for lenovo laptop
LAPTOP="eDP1"
DISPALY="DP1"
WGA="DP2"

GIRLS_WALLPAPER=~/pictures/pastel-girls
RETRO_WALLPAPERS=~/pictures/retro2D
EYE_WALLPAPERS=~/pictures/eye-wallpaper
DARK_WALLPAPERS=~/pictures/dark-wallpaper
MINECRAFT_WALLPAPERS=~/pictures/minecraft-wallpaper

MSG="Choose monitor setup: "
OPT=(
"laptop"
"VGA normal"
"VGA left"
"duplicated on VGA"
"laptop+vertical"
"laptop+horizontal"
"two monitors in T"
"two monitors in horizontal"
"refresh girl wallpaper"
"refresh retro wallpaper"
"refresh eye wallpaper"
"refresh dark wallpaper"
"refresh minecraft wallpaper"
)
CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -l 5 -p "$MSG")

case $CHOICE in
  ${OPT[0]})
    xrandr --output $LAPTOP --mode 1920x1080 --output $DISPALY --off --output $WGA --off
    ;;
  ${OPT[1]})
    xrandr --output $LAPTOP --off --output $DISPALY --off --output $WGA --mode 1920x1080 --primary --rotate normal
    ;;
  ${OPT[2]})
    xrandr --output $LAPTOP --off --output $DISPALY --off --output $WGA --mode 1920x1080 --primary --rotate left
    ;;
  ${OPT[3]})
    xrandr --output $LAPTOP --mode 1920x1080 --output $DISPALY --off --output $WGA --same-as $LAPTOP
    ;;
  ${OPT[4]})
    xrandr --output $LAPTOP ---mode 1920x1080 --primary --pos 0x840 --output $DISPALY --off --output $WGA --mode 1920x1080 --rotate left --pos 1920x0
    ;;
  ${OPT[5]})
    xrandr --output $LAPTOP ---mode 1920x1080 --primary --output $DISPALY --off --output $WGA --mode 1920x1080
    ;;
  ${OPT[6]})
    xrandr --output $LAPTOP --off --output $DISPALY --mode 1920x1080 --rotate left --pos 1920x0 --output $WGA --mode 1920x1080 --primary --pos 0x840
    ;;
  ${OPT[7]})
    xrandr --output $LAPTOP --off --output $DISPALY --mode 1920x1080 --output $WGA --mode 1920x1080 --primary --left-of $DISPALY
    ;;
  ${OPT[8]})
    nitrogen --set-centered --set-color=#000 --random ${GIRLS_WALLPAPER} --head=0 &&
    nitrogen --set-centered --set-color=#000 --random "${GIRLS_WALLPAPER}" --head=1 &&
    nitrogen --set-centered --set-color=#000 --random "${GIRLS_WALLPAPER}" --head=2
    ;;
  ${OPT[9]})
    nitrogen --set-centered --set-color=#000 --random ${RETRO_WALLPAPERS} --head=0 &&
    nitrogen --set-centered --set-color=#000 --random "${RETRO_WALLPAPERS}" --head=1 &&
    nitrogen --set-centered --set-color=#000 --random "${RETRO_WALLPAPERS}" --head=2
    ;;
  ${OPT[10]})
    nitrogen --set-centered --set-color=#000000 --random ${EYE_WALLPAPERS} --head=0 &&
    nitrogen --set-centered --set-color=#000000 --random "${EYE_WALLPAPERS}" --head=1 &&
    nitrogen --set-centered --set-color=#000000 --random "${EYE_WALLPAPERS}" --head=2
    ;;
  ${OPT[11]})
    nitrogen --set-centered --set-color=#000000 --random ${DARK_WALLPAPERS} --head=0 &&
    nitrogen --set-centered --set-color=#000000 --random "${DARK_WALLPAPERS}" --head=1 &&
    nitrogen --set-centered --set-color=#000000 --random "${DARK_WALLPAPERS}" --head=2
    ;;
  ${OPT[12]})
    nitrogen --set-centered --set-color=#373737 --random ${MINECRAFT_WALLPAPERS} --head=0 &&
    nitrogen --set-centered --set-color=#373737 --random "${MINECRAFT_WALLPAPERS}" --head=1 &&
    nitrogen --set-centered --set-color=#373737 --random "${MINECRAFT_WALLPAPERS}" --head=2
    ;;
  *)
    printf "%s" "command not implemented T_T"
    ;;
esac

exit 0

