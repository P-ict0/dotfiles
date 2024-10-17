#!/bin/bash

# Check the current state of Dunst's Do Not Disturb
if dunstctl is-paused | grep -q "true"; then
    # Temporarily disable Do Not Disturb
    dunstctl set-paused false
    dunstctl close-all
    # Show notification that DND is enabled
    notify-send -i "dialog-warning" "DND Status" "Do Not Disturb is currently enabled"
    sleep 3
    # Re-enable Do Not Disturb after notification
    dunstctl set-paused true
else
    # Show notification that DND is disabled
    notify-send -i "dialog-information" "DND Status" "Do Not Disturb is currently disabled"
fi

