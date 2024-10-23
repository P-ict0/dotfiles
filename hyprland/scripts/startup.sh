#!/bin/bash

# Startup apps with delays
dunstctl set-paused false
notify-send -t 10000 "Starting up..."
sleep 2
hyprctl dispatch workspace 5
bash $HOME/scripts/firefox_startup/firefox_agenda.sh
sleep 0.5
hyprctl dispatch togglespecialworkspace
firefox --no-remote --new-window https://web.whatsapp.com/ &
sleep 0.5
hyprctl dispatch togglespecialworkspace
sleep 0.5
hyprctl dispatch workspace 2
firefox &
sleep 0.5
hyprctl dispatch workspace 1
kitty &

dunstctl close-all
notify-send -t 5000 "Setup done!"
