#!/bin/bash

# Taken from https://www.ostechnix.com/backup-entire-linux-system-using-rsync/
# Taken on 20180803
#
# First you'll want to mount your external drive with
#
#sudo mount /dev/sd(external drive) /mnt
#
# Run the following command as root
#sudo rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /mnt

sudo rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /mnt

#This command will backup the entire root ( / ) directory, excluding /dev, /proc, /sys, /tmp, /run, /mnt, /media, /lost+found directories, and save the data in /mnt folder.
#
#Let us break down the above command and see what each argument does.
#
# rsync – A fast, versatile, local and remote file-copying utility
# -aAXv – The files are transferred in “archive” mode, which ensures that symbolic links, devices, permissions, ownerships, modification times, ACLs, and extended attributes are preserved.
# / – Source directory
# –exclude – Excludes the given directories from backup.
# /mnt – It is the backup destination folder.
#
#Please be mindful that you must exclude the destination directory, if it exists in the local system. It will avoid the an infinite loop.
