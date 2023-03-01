#!/bin/bash
# restore the latest version; sync it with other systems
# DON'T PUSH LATEST 3D MODELS


rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --delete ~/instructions/ /mnt/sanDisk/back-up/instructions/
rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --exclude 'ender/' --delete ~/documents/ /mnt/sanDisk/back-up/documents/
rsync -aAXv --delete ~/qmk_firmware/keyboards/tiberlas/ /mnt/sanDisk/back-up/qmk_firmware/keyboards/tiberlas/
sudo umount /dev/sda1/ /mnt/sanDisk/

exit 0
