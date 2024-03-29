#!/bin/bash
# create a new version of back-up
# before running this mount the usb drive

rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --exclude 'venv/' --delete ~/instructions/ /mnt/sanDisk/back-up/instructions/
rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --exclude 'venv/' --delete ~/documents/ /mnt/sanDisk/back-up/documents/
rsync -aAXv --delete ~/qmk_firmware/keyboards/tiberlas/ /mnt/sanDisk/back-up/qmk_firmware/keyboards/tiberlas/

exit 0
