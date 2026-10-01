#!/usr/bin/env bash
# show if xfwm4 owns the screen or not.
# run: ./check.sh
set -u

wmctrl -m
ps aux | grep -E "[x]fwm4"
