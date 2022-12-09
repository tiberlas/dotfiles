################################################################################
#
#  _    _   _ _               _             author: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     httpie template
# | __|| __| | '_ \ / _ \ '__| | | | / __|
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/
#
################################################################################
#!/bin/bash

ACCESS_TOKEN="1234"
URL="https://something"
BODY=$(cat <<-END
	{
		"key": "value"
	}
END
)

echo $BODY | http -v POST $URL x-api-key:"$ACCESS_TOKEN"
http -v GET $URL
http -v DELETE $URL
