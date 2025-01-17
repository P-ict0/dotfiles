#!/bin/bash

# Get the location
LOCATION=$(geoiplookup $(curl -s ifconfig.me) | awk -F', ' '/City Edition/ {print $5}')

# If the location is empty or "N/A", default to Eindhoven
if [ -z "$LOCATION" ] || [ "$LOCATION" = "N/A" ]; then
  LOCATION="Eindhoven"
fi

# Run wttrbar with the determined location
OUTPUT=$(/usr/bin/wttrbar --nerd --location "$LOCATION")

# Check for the invalid response and fall back to Eindhoven if needed
if echo "$OUTPUT" | grep -q '"tooltip":"invalid wttr.in response"'; then
  OUTPUT=$(/usr/bin/wttrbar --nerd --location "Eindhoven")
fi

# Output the result
echo "$OUTPUT"
