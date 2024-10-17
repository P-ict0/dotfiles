#!/bin/bash

# Check the current state of Dunst's Do Not Disturb
if dunstctl is-paused | grep -q "false"; then
    # Enable Do Not Disturb
    notify-send -i "audio-volume-muted" "DND enabled" "Do Not Disturb mode activated"
    sleep 3
    dunstctl close-all
    dunstctl set-paused true
else
    # Disable Do Not Disturb
    dunstctl close-all
    dunstctl set-paused false
    notify-send -i "audio-volume-high" "DND disabled" "Do Not Disturb mode deactivated"
fi

