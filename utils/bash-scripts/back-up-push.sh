#!/bin/bash
# create a new version of back-up
# before running this mount the usb drive

rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --delete ~/instructions/ /mnt/sanDisk/back-up/instructions/
rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --delete ~/documents/ /mnt/sanDisk/back-up/documents/

exit 0
