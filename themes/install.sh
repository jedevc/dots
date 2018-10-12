#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/gtk-2.0 $DESTINATION/.gtkrc-2.0

mkdir -p $DESTINATION/.config/gtk-3.0
cp $SOURCE/gtk-3.0 $DESTINATION/.config/gtk-3.0/settings.ini

mkdir -p $DESTINATION/.config/qt5ct
cp $SOURCE/qt5ct.conf $DESTINATION/.config/qt5ct/qt5ct.conf

cp $SOURCE/Trolltech.conf $DESTINATION/Trolltech.conf
