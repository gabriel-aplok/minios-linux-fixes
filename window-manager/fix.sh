#!/usr/bin/env bash
# no title bars or borders, bring xfwm4 back.
# run: ./fix.sh
set -u

LOG_FILE="/tmp/xfwm4-replace.log"

nohup xfwm4 --replace > "$LOG_FILE" 2>&1 & disown
sleep 1
wmctrl -m
