#!/bin/bash

# Get the current hour (24-hour format)
hour=$(date +"%H")

# Get the current date and time
current_date=$(date +"%A, %B %d, %Y")

# Greet the user based on the time of day
if [ $hour -ge 5 ] && [ $hour -lt 12 ]; then
  greeting="Good Morning!"
elif [ $hour -ge 12 ] && [ $hour -lt 18 ]; then
  greeting="Good Afternoon!"
else
  greeting="Good Evening!"
fi

# Display the greeting, current date, time, and motivational quote
echo ""
echo "==========================================================="
echo "$greeting"
echo "Today is: $current_date"
echo "==========================================================="

exec $SHELL
