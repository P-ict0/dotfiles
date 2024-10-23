#!/bin/bash

# Startup apps with delays
dunstctl set-paused false
notify-send -t 100000 "Starting up..."
sleep 2
hyprctl dispatch workspace 10
kitty -e btop &
sleep 0.5
hyprctl dispatch workspace 6
notion-app &
sleep 4
hyprctl dispatch workspace 5
bash $HOME/scripts/startup/firefox_agenda.sh
sleep 2
hyprctl dispatch togglespecialworkspace
firefox --no-remote --new-window https://web.whatsapp.com/ &
sleep 1
hyprctl dispatch togglespecialworkspace
sleep 0.5
hyprctl dispatch workspace 3
spotify-launcher &
sleep 2
hyprctl dispatch workspace 2
firefox &
sleep 2
hyprctl dispatch workspace 1
kitty -e $HOME/scripts/startup/greeting_terminal.sh &

dunstctl close-all
notify-send -t 5000 "Setup done!"
