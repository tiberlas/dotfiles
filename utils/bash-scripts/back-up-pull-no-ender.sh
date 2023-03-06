#!/bin/bash
# restore the latest version; sync it with other systems
# DON'T PULL LATEST 3D MODELS

sudo mount -o umask=000,uid=$USER,gid=$USER /dev/sda1 /mnt/sanDisk/
rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --delete /mnt/sanDisk/back-up/instructions/ ~/instructions/
rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --exclude 'ender/' --delete /mnt/sanDisk/back-up/documents/ ~/documents/
rsync -aAXv --delete /mnt/sanDisk/back-up/qmk_firmware/keyboards/tiberlas/ ~/qmk_firmware/keyboards/tiberlas/

exit 0
