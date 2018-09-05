#!/bin/bash

# This script modifies the GOG (Linux) launch script for Never Alone Arctic
# Collection by setting the environment variable 'LC_ALL' to 'C'. If the
# variable is not set, controllers might be unresponsive or might not work at
# all.

# A similar fix for the Steam release can be achieved by setting
# 'LC_ALL=C %command%' under 'Properties -> Set Launch Options'.

if [ -z "$1" ]
then echo "Please provide install path for Never Alone (1st argument)"
     exit 1
fi

game="${1%/}"/start.sh

if grep -q "^LC_ALL=C$" "$game"
then echo "Launch script already patched!"
     exit 0
fi

# Add 'LC_ALL=C' after the '# Initialization' line
sed -i 's/^# Init.*$/&\nLC_ALL=C/g' "$game"
