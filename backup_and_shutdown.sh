#!/bin/bash

echo
echo Mount your external drive to '/mnt'.
echo
echo Press 'Enter' to continue...
read
echo

sudo rsync -aAXv / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /mnt/
sudo shutdown
