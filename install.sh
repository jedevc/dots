#!/bin/bash

if [ -z "$1" ]; then
	DESTINATION=$HOME
else
	DESTINATION="$1"
	mkdir -p $DESTINATION
fi

echo "Installing to $DESTINATION."

echo "Installing scripts..."
cp -r bin/ $DESTINATION

echo "Installing zsh..."
./zsh/install.sh $DESTINATION

echo "Installing x11..."
./x11/install.sh $DESTINATION

echo "Installing themes..."
./themes/install.sh $DESTINATION

echo "Installing misc..."
cp wallpaper.png $DESTINATION/.wallpaper.png
feh --bg-scale $DESTINATION/.wallpaper.png

echo "Done."
