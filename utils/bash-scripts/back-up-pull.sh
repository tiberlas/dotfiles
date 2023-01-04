#!/bin/bash
# restore the latest version; sync it with other systems
# before running this mount the usb drive

rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --delete /mnt/sanDisk/back-up/instructions/ ~/instructions/
rsync -aAXv --exclude 'node_modules/' --exclude 'workspace/liveramp-repos/' --delete /mnt/sanDisk/back-up/documents/ ~/documents/

exit 0
