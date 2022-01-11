################################################################################
#                                           
#  _    _   _ _               _             author: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     curl template
# | __|| __| | '_ \ / _ \ '__| | | | / __|    
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
#                                             
################################################################################

#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'

echo -e $TEXT_YELLOW
echo "ᕙ(▀̿̿Ĺ̯̿̿▀̿ ̿) ᕗ"
echo -e $TEXT_RESET
URL="http://localhost:3000/test"
ACCESS_TOKEN=""
AUTHORIZATION=""

BODY=$(cat <<-END
  {
    "attr": "value", 
  }
END
)

curl -X POST \
  #-H "Authorization: Bearer $AUTHORIZATION" \
  -H "x-api-key: $ACCESS_TOKEN" \
  -H "Content-Type: application/json" \
  -H "accept: application/json" \
  -d "$BODY" \
  -v $URL

echo -e $TEXT_YELLOW
echo "(੭ˊᵕˋ)੭.*･｡ﾟ"
echo -e $TEXT_RESET

