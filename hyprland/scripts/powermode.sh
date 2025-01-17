#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
  /usr/bin/echo "Please run this script with sudo."
  exit 1
fi

CONFIG_FILE="/etc/default/cpupower"

# Read the current governor from the config file
CURRENT_GOVERNOR=$(/usr/bin/grep -E "^\s*governor='[^']+'" "$CONFIG_FILE" | /usr/bin/grep -v '^\s*#' | /usr/bin/head -n1 | /usr/bin/cut -d"'" -f2)

if [ -z "$CURRENT_GOVERNOR" ]; then
  /usr/bin/echo "Governor not found or not set in $CONFIG_FILE"
  exit 1
fi

if [ "$CURRENT_GOVERNOR" = "conservative" ]; then
  # Change to powersave
  /usr/bin/sed -i "s/^\s*governor='conservative'/governor='powersave'/" "$CONFIG_FILE"
  /usr/bin/cpupower frequency-set -g powersave >/dev/null 2>&1
  /usr/bin/echo "Powersave mode enabled."
elif [ "$CURRENT_GOVERNOR" = "powersave" ]; then
  # Change to conservative
  /usr/bin/sed -i "s/^\s*governor='powersave'/governor='conservative'/" "$CONFIG_FILE"
  /usr/bin/cpupower frequency-set -g performance >/dev/null 2>&1
  /usr/bin/echo "Performance mode enabled."
else
  /usr/bin/echo "Unknown governor: $CURRENT_GOVERNOR"
  exit 1
fi
