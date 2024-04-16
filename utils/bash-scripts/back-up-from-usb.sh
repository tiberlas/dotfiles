#!/bin/bash
# ################################
# mounts USB to **back-up-drive**
# USB -> Anguish (restore from USB)
# unmount USB
# ################################

echo "| :usb: => :desktop_computer: |"

# MOUNT
sudo mount -o umask=000,uid=$USER,gid=$USER /dev/sdd1 /mnt/back-up-drive/
echo "|> MOUNT USB"

# GENERAL
echo "|> INSTRUCTIONS"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/back-up-drive/instructions/ /mnt/md0/instructions/
echo "|> T2API"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/back-up-drive/T2API/ /mnt/md0/T2API/
echo "|> KEYS"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/back-up-drive/key-poem.kdbx /mnt/md0/key-poem.kdbx
echo "|> BOOKS"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/back-up-drive/books/ /mnt/md0/books/

# OLL SPECIFIC
echo "|> OLL"
rsync -aAXv --exclude 'node_modules/' --exclude 'venv/' --delete /mnt/back-up-drive/workspace/oll/instructions/ /mnt/md0/workspace/oll/instructions/

# Ender and QMK


# UNMOUNT
sudo umount /dev/sdd1/ /mnt/back-up-drive/
echo "|> UNMOUNT USB"

exit 0
