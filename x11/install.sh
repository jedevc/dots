#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/xinitrc $DESTINATION/.xinitrc
cp $SOURCE/xprofile $DESTINATION/.xprofile

mkdir -p $DESTINATION/.config
cp -r $SOURCE/i3 $DESTINATION/.config
cp -r $SOURCE/rofi $DESTINATION/.config
cp -r $SOURCE/termite $DESTINATION/.config
cp -r $SOURCE/polybar $DESTINATION/.config

$SOURCE/themes/install.sh $DESTINATION
