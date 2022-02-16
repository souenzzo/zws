#!/usr/bin/env sh

set -e

IP_FILE="$HOME/current_ip"
OLD_IP="$(cat "$IP_FILE" || echo)"
NEW_IP="$(curl -s -4 'https://ifconfig.me/')"

if [ "x$OLD_IP" = "x$NEW_IP" ]; then
  echo "no update: $OLD_IP"
  exit 0
else
  echo "new ip: $NEW_IP"
  echo "$NEW_IP" >"$IP_FILE"
  systemctl --user restart dnsupdate
fi
