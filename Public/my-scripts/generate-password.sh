################################################################################
#                                           
#  _    _   _ _               _             author: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     generate a password and save it in clipboard
# | __|| __| | '_ \ / _ \ '__| | | | / __|    
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
#                                             
################################################################################
#!/bin/bash
# needed dependencies: xclip and pwgen

PASS=$(pwgen -ysBv 17 1)
echo "${PASS}" | xclip -selection c
printf '\e[31m%s\e[0m\n\n' "generated in clipboard ᕙ(▀̿̿Ĺ̯̿̿▀̿ ̿) ᕗ"

exit 0
