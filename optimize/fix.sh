#!/usr/bin/env bash
# cut boot time and free disk space on minios.
# safe stuff only, nothing you need daily.
# run: ./fix.sh
set -u

echo "turn off heavy boot services"
sudo systemctl disable docker.service containerd.service
sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl disable avahi-daemon.service
sudo systemctl disable libvirtd.service libvirt-guests.service
sudo systemctl disable iperf3.service
sudo systemctl disable gpm.service

echo "hide dead autostart apps"
mkdir -p "$HOME/.config/autostart"
for app in volumeicon vmware-user onboard-autostart org.gnome.Software; do
  src="/etc/xdg/autostart/$app.desktop"
  dst="$HOME/.config/autostart/$app.desktop"
  if [ -f "$src" ] && ! grep -q "^Hidden=true" "$dst" 2>/dev/null; then
    cp "$src" "$dst"
    echo "Hidden=true" >> "$dst"
    echo "hidden $app"
  fi
done

echo "clean packages"
sudo apt autoremove --purge -y
sudo apt clean
flatpak uninstall --unused -y 2>/dev/null || true

echo "clean cache"
rm -rf "$HOME/.cache/thumbnails/"* "$HOME/.cache/sessions/thumbs-"*
journalctl --vacuum-time=7d 2>/dev/null || sudo journalctl --vacuum-time=7d

echo "trim logs"
sudo journalctl --vacuum-size=100M
sudo find /var/log -type f -name "*.gz" -delete
sudo find /var/log -type f -name "*.old" -delete

echo "done, reboot to feel it"
