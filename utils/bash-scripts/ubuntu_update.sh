################################################################################
#                                           
#                                           author: Victor Bocharsky: bocharsky-bw
#  _    _   _ _               _             modified: t.tiberius
# | |  | | (_) |             (_)            usage:
# | |_ | |_ _| |__   ___ _ __ _ _   _ ___     debian based system update with brew
# | __|| __| | '_ \ / _ \ '__| | | | / __|    
# | |_ | |_| | |_) |  __/ |  | | |_| \__ \    
#  \__(_)__|_|_.__/ \___|_|  |_|\__,_|___/    
#                                             
################################################################################

#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;34m'
TEXT_RED_B='\e[1;31m'

echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET
sudo apt-get update -y

echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET
sudo apt-get upgrade -y

echo -e $TEXT_YELLOW
echo 'APT auto remove finished...'
echo -e $TEXT_RESET
sudo apt-get autoremove -y

echo -e $TEXT_YELLOW
echo 'APT clean finished...'
echo -e $TEXT_RESET
sudo apt-get clean -y

echo -e $TEXT_YELLOW
echo 'brew update...'
echo -e $TEXT_RESET
brew update

echo -e $TEXT_YELLOW
echo 'brew upgrade...'
echo -e $TEXT_RESET
brew upgrade

if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_RED_B
    echo 'Reboot required!'
    echo -e $TEXT_RESET
fi

