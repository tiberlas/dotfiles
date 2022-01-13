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

MSG="Choose monitor setup: "
OPT=(
"l (laptop)"
"lv (laptop+vertical)"
"t (two monitors)"
)
CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -p "$MSG")

case $CHOICE in
  ${OPT[0]})
    echo "ONE"
    ;;
  ${OPT[1]})
    echo "TWO"
    ;;
  quit)
    echo "quit"
    ;;
  *)
    echo "NJET"
    ;;
esac

exit 0
