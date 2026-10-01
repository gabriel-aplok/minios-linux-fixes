#!/usr/bin/env bash
# old saved session has no xfwm4 in it, delete it so xfce stops
# loading a broken desktop. log out with save session checked after fix.sh.
# run: ./clear-session.sh
set -u

rm -f "$HOME/.cache/sessions/xfce4-session-"*:0
echo "session cleared"
