#!/usr/bin/env bash
# try faster compositor modes. run one, feel it, keep what you like.
# run: ./compositor.sh [xpresent|off|on]
set -u

MODE="${1:-xpresent}"

case "$MODE" in
  xpresent)
    xfconf-query -c xfwm4 -p /general/use_compositing -s true
    xfconf-query -c xfwm4 -p /general/vblank_mode -s xpresent
    echo "compositor on, vblank xpresent"
    ;;
  off)
    xfconf-query -c xfwm4 -p /general/use_compositing -s false
    echo "compositor off, max speed, no shadows"
    ;;
  on)
    xfconf-query -c xfwm4 -p /general/use_compositing -s true
    xfconf-query -c xfwm4 -p /general/vblank_mode -s auto
    echo "back to default"
    ;;
  *)
    echo "use: ./compositor.sh [xpresent|off|on]"
    exit 1
    ;;
esac
