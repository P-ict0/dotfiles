#!/bin/bash

# Path to your file
file="$HOME/.config/hypr/monitors.conf"

# Extract the current refresh rate of eDP-1 monitor
current_rate=$(grep 'eDP-1' "$file" | sed -E 's/.*@([0-9]+),.*/\1/')

# Determine the next refresh rate
case $current_rate in
240)
  new_rate=60
  ;;
60)
  new_rate=240
  ;;
*)
  exit 1
  ;;
esac

# Replace the refresh rate in the file
sed -i "s/eDP-1, [0-9x]*@$current_rate/eDP-1, 2560x1600@$new_rate/" "$file"

notify-send "Changed refresh rate to:" "$new_rate Hz"
