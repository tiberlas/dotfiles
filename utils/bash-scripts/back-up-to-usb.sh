#!/bin/bash
# ################################
# mounts USB to **back-up-drive**
# Anguish -> USB (backup to USB)
# unmount USB
# ################################

echo "| :desktop_computer: => :usb: |"

# MOUNT
sudo mount -o umask=000,uid=$USER,gid=$USER /dev/sdd1 /mnt/back-up-drive/
echo "|> MOUNT USB"

# GENERAL
echo "|> INSTRUCTIONS"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/md0/instructions/ /mnt/back-up-drive/instructions/
echo "|> T2API"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/md0/T2API/ /mnt/back-up-drive/T2API/
echo "|> KEYS"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/md0/key-poem.kdbx /mnt/back-up-drive/key-poem.kdbx
echo "|> BOOKS"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/md0/books/ /mnt/back-up-drive/books/

# OLL SPECIFIC
echo "|> OLL"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/md0/workspace/oll/instructions/ /mnt/back-up-drive/workspace/oll/instructions/

# Ender and QMK
#rsync -aAXv --delete ~/qmk_firmware/keyboards/tiberlas/ /mnt/sanDisk/back-up/qmk_firmware/keyboards/tiberlas/

# UNMOUNT
sudo umount /dev/sdd1/ /mnt/back-up-drive/
echo "|> UNMOUNT USB"

exit 0
