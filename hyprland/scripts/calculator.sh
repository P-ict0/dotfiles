#!/bin/sh
# Display prompt using rofi
expression=$(rofi -dmenu -p 'enter expression' -theme-str 'listview {lines: 7;} entry {text-color: #f2d5cf;} window {background: #303446;} listview {fixed-height: false;}')

# Check if the user provided an input
if [ -n "$expression" ]; then
  # Modify the expression to fit Lua print syntax
  echo "print($expression)" >/tmp/question

  # Evaluate the Lua expression and store the result
  lua /tmp/question >/tmp/answer

  # Format the result for notify-send
  sed -i 's/^/‎/' /tmp/answer

  # If dunst is in do not disturb mode, disable it
  if [ "$(dunstctl is-paused)" = "true" ]; then
    # Store the current do not disturb status
    dnd_status=1
    dunstctl close-all
    dunstctl set-paused false
  fi

  # Show the result in a notification
  cat /tmp/answer | xargs -n 1 notify-send -i ~/Pictures/calculator.png -t 99999999 'And the answer is...'
  
  if [ "$dnd_status" -eq 1 ]; then
    # Restore the previous do not disturb status
    sleep 5
    dunstctl set-paused true
  fi

  # Copy the result to the clipboard
  cat /tmp/answer | wl-copy -n

  # Clean up temporary files
  rm -f /tmp/question /tmp/answer
fi
