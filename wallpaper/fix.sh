#!/usr/bin/env bash
# black wallpaper, bring xfdesktop back.
# run: ./fix.sh
set -u

LOG_FILE="/tmp/xfdesktop.log"

nohup xfdesktop > "$LOG_FILE" 2>&1 & disown
sleep 1
DISPLAY="${DISPLAY:-:0}" xfdesktop --reload
echo "wallpaper back"
