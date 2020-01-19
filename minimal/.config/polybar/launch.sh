#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# wait until all processed have shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bar
echo "---" | tee -a /tmp/polybar.log 2>&1 &
polybar example &

echo "Bar launched.. "
