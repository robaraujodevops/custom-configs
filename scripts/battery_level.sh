#!/bin/bash

# macOS
if command -v pmset &>/dev/null; then
  pmset -g batt | grep -Eo "\d+%" | cut -d% -f1
# Linux (UPower)
elif command -v upower &>/dev/null; then
  upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}'
else
  echo "N/A"
fi
