#!/bin/bash

echo "ERROR: Stop using dropbox!"
exit 1

machine=$(hostname)
echo "Mounting directories on $machine..."

if [[ "$machine" == "averno" ]]; then
    cryfs ~/Dropbox/dropbox_encrypted ~/dropbox_decrypted
elif [[ "$machine" == "darcy" ]]; then
    cryfs ~/Dropbox/dropbox_encrypted ~/dropbox_decrypted
elif [[ "$machine" == "sdb-desktop" ]]; then
    cryfs ~/Documents/Dropbox/dropbox_encrypted ~/dropbox_decrypted
else
    echo "ERROR: Unknown machine!"
    exit 1
fi

##########################################################
# https://www.cryfs.org/tutorial/
# sudo apt install cryfs
# cryfs ~/Dropbox/dropbox_encrypted ~/dropbox_decrypted
##########################################################
# OLD ENCRYPT DROPBOX
# http://www.howtogeek.com/121737/how-to-encrypt-cloud-storage-on-linux-and-windows-with-encfs/
##########################################################

