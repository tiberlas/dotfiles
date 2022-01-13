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
# ports for lenovo laptop
LAPTOP="eDP-1"
DISPALY="DP-1"
WGA="DP-2"

MSG="Choose monitor setup: "
OPT=(
"l (laptop)"
"lv (laptop+vertical)"
"t (two monitors)"
"all (two monitors and laptop bellow)"
)
CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -l 5 -p "$MSG")

case $CHOICE in
  ${OPT[0]})
    xrandr --output $LAPTOP --mode 1920x1080 --output $DISPALY --off --output $WGA --off &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper
    ;;
  ${OPT[1]})
    xrandr --output $LAPTOP ---mode 1920x1080 --output $DISPALY --off --output $WGA --mode 1920x1080 ---rotate left -left-of $LAPTOP &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper --head=0 &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper --head=1
    ;;
  ${OPT[2]})
    xrandr --output $LAPTOP --off --output $DISPALY --mode 1920x1080 --rotate left --output $WGA --mode 1920x1080 --left-of $DISPALY &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper --head=0 &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper --head=1
    ;;
  ${OPT[3]})
    xrandr --output $LAPTOP --mode 1920x1080 --below $WGA --output $DISPALY --mode 1920x1080 --rotate left --output $WGA --mode 1920x1080 --left-of $DISPALY &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper --head=0 &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper --head=1 &&
    nitrogen --set-centered --set-color=#373737 --random ~/Pictures/minecraft-wallpaper --head=2
    ;;
  *)
    printf "%s" "command not implemented T_T"
    ;;
esac

exit 0
