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
LAPTOP="eDP-1"
DISPALY="DP-1"
WGA="DP-2"

MINECRAFT_WALLPAPERS=~/Pictures/minecraft-wallpaper
RETRO_WALLPAPERS=~/Pictures/retro2D

MSG="Choose monitor setup: "
OPT=(
"l (laptop)"
"duplicate (laptop duplicated on WGA)"
"lv (laptop+vertical)"
"lh (laptop+horizontal)"
"t (two monitors in T)"
"w (two monitors in hoziontal; wide)"
"all (two monitors and laptop bellow)"
"rm (refresh minecraft wallpaper)"
"rr (refresh retro wallpaper)"
)
CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -l 5 -p "$MSG")

case $CHOICE in
  ${OPT[0]})
    xrandr --output $LAPTOP --mode 1920x1080 --output $DISPALY --off --output $WGA --off
    ;;
  ${OPT[1]})
    xrandr --output $LAPTOP --mode 1920x1080 --output $DISPALY --off --output $WGA --same-as $LAPTOP
    ;;
  ${OPT[2]})
    xrandr --output $LAPTOP ---mode 1920x1080 --primary --pos 0x840 --output $DISPALY --off --output $WGA --mode 1920x1080 --rotate left --pos 1920x0
    ;;
  ${OPT[3]})
    xrandr --output $LAPTOP ---mode 1920x1080 --primary --output $DISPALY --off --output $WGA --mode 1920x1080
    ;;
  ${OPT[4]})
    xrandr --output $LAPTOP --off --output $DISPALY --mode 1920x1080 --rotate left --pos 1920x0 --output $WGA --mode 1920x1080 --primary --pos 0x840
    ;;
  ${OPT[4]})
    xrandr --output $LAPTOP --off --output $DISPALY --mode 1920x1080 --output $WGA --mode 1920x1080 --primary --left-of $DISPALY
    ;;
  ${OPT[6]})
    xrandr --output $LAPTOP --mode 1920x1080 --below $WGA --output $DISPALY --mode 1920x1080 --rotate left --output $WGA --mode 1920x1080 --left-of $DISPALY
    ;;
  ${OPT[7]})
    nitrogen --set-centered --set-color=#373737 --random ${MINECRAFT_WALLPAPERS} --head=0 &&
    nitrogen --set-centered --set-color=#373737 --random "${MINECRAFT_WALLPAPERS}" --head=1 &&
    nitrogen --set-centered --set-color=#373737 --random "${MINECRAFT_WALLPAPERS}" --head=2
    ;;
  ${OPT[8]})
    nitrogen --set-centered --set-color=#000 --random ${RETRO_WALLPAPERS} --head=0 &&
    nitrogen --set-centered --set-color=#000 --random "${RETRO_WALLPAPERS}" --head=1 &&
    nitrogen --set-centered --set-color=#000 --random "${RETRO_WALLPAPERS}" --head=2
    ;;
  *)
    printf "%s" "command not implemented T_T"
    ;;
esac

exit 0
