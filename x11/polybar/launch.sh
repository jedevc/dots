#!/bin/bash

# kill old polybars and wait for them to exit
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.5; done

# launch bars
polybar main
