#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/zshrc $DESTINATION/.zshrc
cp $SOURCE/zshenv $DESTINATION/.zshenv
cp $SOURCE/zprofile $DESTINATION/.zprofile
