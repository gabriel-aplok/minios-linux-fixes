#!/usr/bin/env bash
# permanent fix: make xfdesktop start on every login, so the wallpaper
# never goes black again. run: ./autostart.sh
set -u

DIR="$HOME/.config/autostart"
FILE="$DIR/xfdesktop.desktop"

mkdir -p "$DIR"
cat > "$FILE" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=XFCE Desktop
Comment=Draws the wallpaper and desktop icons
Exec=xfdesktop
Terminal=false
OnlyShowIn=XFCE;
DESKTOP

echo "wrote $FILE"
