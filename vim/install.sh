#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/vimrc $DESTINATION/.vimrc
mkdir -p $DESTINATION/.vim/swap
mkdir -p $DESTINATION/.vim/undo
