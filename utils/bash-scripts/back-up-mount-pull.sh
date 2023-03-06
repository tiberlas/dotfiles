#!/bin/bash
# mounts the backup USB and restore the latest version

sudo mount -o umask=000,uid=$USER,gid=$USER /dev/sda1 /mnt/sanDisk/
bash ./back-up-pull.sh

exit 0
