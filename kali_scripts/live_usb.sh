#/bin/bash/

# Run as root.

dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync
