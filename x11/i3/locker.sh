#!/bin/bash

if ! pgrep i3lock; then
	i3lock -n -i ~/.wallpaper.png -t
fi
