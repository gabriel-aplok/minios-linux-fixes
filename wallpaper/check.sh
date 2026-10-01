#!/usr/bin/env bash
# show if xfdesktop runs and what image it should draw.
# run: ./check.sh
set -u

ps aux | grep -E "[x]fdesktop"
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitoreDP-1/workspace0/last-image
