#!/bin/sh

# This script reconfigures Chromebook boot settings (Debian ⇨ ChromeOS)

cgpt add -i 6 -S 1 -P 0 /dev/mmcblk0
case "$1" in
    now* ) echo "Will reboot to ChromeOS now..."
           sleep 3
           reboot ;;
    * ) echo "Will boot ChromeOS on next (re)boot..." ;;
esac
