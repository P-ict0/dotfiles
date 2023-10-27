#!/bin/bash

/usr/bin/upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep capacity | awk '{printf "%.2f%%\n", $2}'
