#!/bin/bash

# kill old compton and wait for it to exit
killall -q compton
while pgrep -u $UID -x compton >/dev/null; do sleep 0.05; done

# launch bars
compton -b -d :0
