#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/xinitrc $DESTINATION/.xinitrc

mkdir -p $DESTINATION/.config
cp -r $SOURCE/i3 $DESTINATION/.config/i3
cp -r $SOURCE/rofi $DESTINATION/.config/rofi
cp -r $SOURCE/termite $DESTINATION/.config/termite
