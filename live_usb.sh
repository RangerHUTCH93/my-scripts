#!/bin/bash/

# Taken from;
#
# https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_dd
#

# Tip: Find out the name of your USB drive with lsblk. Make sure that it is not mounted.

# Run the following command, replacing /dev/sdx with your drive, e.g. /dev/sdb. (Do not append a partition number, so do not use something like /dev/sdb1)

# Run as root.

dd bs=4M if=/path/to/archlinux.iso of=/dev/sd status=progress oflag=sync
