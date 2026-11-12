#!/usr/bin/env bash
# run every fix on a fresh minios install.
# safe to run more than once.
# run: ./install.sh
set -u

DIR="$(cd "$(dirname "$0")" && pwd)"

echo "== wallpaper =="
"$DIR/wallpaper/autostart.sh"
"$DIR/wallpaper/fix.sh"

echo "== window manager =="
"$DIR/window-manager/fix.sh"

echo "== done =="
echo "log out with save session checked once, then reboot"
