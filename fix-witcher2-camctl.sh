#!/bin/bash

# Like its predecessor, The Witcher 2 is designed to be as complex and
# unintuitive as possible, so that those dirty console-playing peasants don't
# ruin it for the glorious PC gaming master race[0].
#
# Or rather: The PC (GOG) version of the game provides no way to change the
# default analog stick sensitivity for controllers. Also, opening and closing
# the Options panel resets any manual configuration edits. Hence this script.
#
# [0] https://youtu.be/P0dXtOVi2yo?t=53

dir="$HOME/.local/share/cdprojektred/witcher2/GameDocuments/Witcher 2/config"

sed -Ei 's/(RightAxis[XY]=.*Value)(=1.0)/\1=0.7/g' "$dir"/User.ini
