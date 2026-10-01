#!/usr/bin/env bash
# bluetooth wakes up on at boot, turn the auto power off. needs sudo.
# run: ./fix.sh
set -u

CONFIG_FILE="/etc/bluetooth/main.conf"

if grep -q "^AutoEnable=false" "$CONFIG_FILE"; then
  echo "already off"
else
  sudo sed -i 's/^#AutoEnable=true/AutoEnable=false/' "$CONFIG_FILE"
  echo "auto power off now"
fi

bluetoothctl power off
