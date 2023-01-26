#!/bin/bash
# mounts the backup USB and restore the latest version

sudo mount -o umask=000,uid=t.tapai,gid=t.tapai /dev/sda1 /mnt/sanDisk/
bash ./back-up-pull.sh

exit 0
