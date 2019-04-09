#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

mkdir -p $DESTINATION/.spacemacs.d/
cp $SOURCE/*.el $DESTINATION/.spacemacs.d/

mkdir -p $DESTINATION/.spacemacs.d/layers
