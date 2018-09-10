#!/bin/sh

# This script disables constant Tracker indexing on Ubuntu 16.04:
# https://bugs.launchpad.net/ubuntu/+source/tracker/+bug/1063255

gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false
tracker reset --hard
