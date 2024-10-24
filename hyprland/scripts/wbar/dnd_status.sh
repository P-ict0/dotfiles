#!/bin/bash

# Check if DND is enabled using dunstctl
if dunstctl is-paused | grep -q "true"; then
  # DND is enabled, show crossed bell
  echo '{"text": "", "class": "dnd"}'
else
  # DND is disabled, show notification bell
  echo '{"text": "", "class": "nodnd"}'
fi
