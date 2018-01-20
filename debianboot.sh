#!/bin/sh

# This script reconfigures Chromebook boot settings (ChromeOS ⇨ Debian)
# Install it on ChromeOS as "/usr/local/bin/debianboot"

cgpt add -i 6 -S 1 -P 5 /dev/mmcblk0
case "$1" in
    now* ) echo "Will boot Debian now..."
           sleep 3
           reboot ;;
    * ) echo "Will boot Debian on next (re)boot..." ;;
esac
