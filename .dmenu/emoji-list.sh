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

MSG="Choose reaction: "
OPT=(
"smile (◕‿◕)"
"joy (´◡\`)"
"smile-star (✦‿✦)"
"happy (*^‿^*)"
"shrug ¯\_(ツ)_/¯"
"shy (｡･･｡)"
"surprised (ᵒ̤̑ ₀̑ ᵒ̤̑)"
"cool (⌐▨_▨)"
"flex ᕙ(▀̿̿Ĺ̯̿̿▀̿ ̿)ᕗ"
"wink (◕‿↼)"
"love (´♡‿♡\`)"
"kiss (˘³˘)"
"crying-lot (╥﹏╥)"
"angry ⸨◺_◿⸩"
"devil Ψ(｀∀´#)ﾉ"
"table-flip (੭ˊᵕˋ)੭.*･｡ﾟ"
"angel ଘ(੭*ˊᵕˋ)੭*"
"but-attack (‿!‿)ԅ(≖‿≖ԅ)"
)
CHOICE=$(printf "%s\n" "${OPT[@]}" | dmenu -i -l 6 -p "$MSG")

echo $CHOICE | awk '{ print $NF }' | xclip -selection c

exit 0
