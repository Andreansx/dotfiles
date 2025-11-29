#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#launching polybar using default config location ~/.config/polybar/config.ini
polybar left &
polybar right &
polybar center &

echo "Polybar launched..."
