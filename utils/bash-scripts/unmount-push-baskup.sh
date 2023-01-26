#!/bin/bash
# makes a backup of the current state and unmounts the USB backup

bash ./back-up-push.sh
sudo umount /dev/sda1/ /mnt/sanDisk/

exit 0
