#!/usr/bin/env bash
# show boot time hogs, disk use, ram use.
# run: ./check.sh
set -u

systemd-analyze blame | head -15
echo "---"
df -h / | tail -1
echo "---"
free -h
