#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/p10k.zsh $DESTINATION/.p10k.zsh
cp $SOURCE/zshrc $DESTINATION/.zshrc
cp $SOURCE/zshenv $DESTINATION/.zshenv
