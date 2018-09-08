#!/bin/bash

# This script adds DualShock 3 support to the Linux (GOG) version of Never
# Alone Arctic Collection. The file ds3_nix.txt, containing the Linux-specific
# DS3->Xbox controller mapping for Unity3D, must be present in order for the
# script to work.

if [ -z "$1" ]
then
    echo "Please provide install path for Never Alone (1st argument)"
    exit 1
fi

sa_dir="${1%/}"/game/Never_Alone_Data/StreamingAssets
manifest="$sa_dir"/input_overrides_nix.manifest
map_file="$sa_dir"/ds3_nix.txt

if [ -a "$map_file" ]
then
    echo "Input mapping file for DualShock 3 already exists:"
    echo "$map_file"
else
    cp ds3_nix.txt "$sa_dir"/.
fi

if grep -q "ds3_nix" "$manifest"
then
    echo "DualShock 3 entry already present:"
    echo "$manifest"
else
    sed -Ei 's/(^.*ds)4(.*$)/\13\2\n\t},\n\t"ENTRY":{\n\14\2/' "$manifest"
fi

echo "Done!"
