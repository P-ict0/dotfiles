#!/bin/bash

# Startup apps with delays
notify-send -t 10000 "Starting up..."
sleep 5
hyprctl dispatch workspace 5
firefox --no-remote --new-window https://www.icloud.com &
sleep 1
hyprctl dispatch togglespecialworkspace
firefox --no-remote --new-window https://web.whatsapp.com/ &
sleep 1
hyprctl dispatch togglespecialworkspace
sleep 1
hyprctl dispatch workspace 2
firefox --no-remote &

# Dismiss notification
dunstctl close-all
