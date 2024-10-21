#!/bin/bash

ip -json route get 8.8.8.8 | jq -r '.[].prefsrc' | wl-copy -n

notify-send "IP copied to clipboard"
