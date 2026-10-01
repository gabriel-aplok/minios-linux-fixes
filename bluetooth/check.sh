#!/usr/bin/env bash
# show if bluetooth is on or off.
# run: ./check.sh
set -u

bluetoothctl show | grep -E "Powered|PowerState"
