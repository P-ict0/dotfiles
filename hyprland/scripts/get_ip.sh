#!/bin/bash

# Get the IP address of the default route to 8.8.8.8 and store it in the 'ip' variable
ip=$(ip -json route get 8.8.8.8 | jq -r '.[].prefsrc')

# Copy the IP address to the clipboard using wl-copy
echo "$ip" | wl-copy -n

# Send a desktop notification with the copied IP address
notify-send -i network "IP copied to clipboard" "$ip"
