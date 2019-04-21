#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

mkdir -p $DESTINATION/.spacemacs.d/
cp $SOURCE/*.el $DESTINATION/.spacemacs.d/

mkdir -p $DESTINATION/.spacemacs.d/layers

if [[ ! -f $DESTINATION/.local/share/fonts/FiraCode-Regular-Symbol.otf ]]; then
	pushd `mktemp -d`

	wget "https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip"
	unzip FiraCode-Regular-Symbol.zip
	mkdir -p $DESTINATION/.local/share/fonts
	mv FiraCode-Regular-Symbol.otf $DESTINATION/.local/share/fonts

	popd
fi
