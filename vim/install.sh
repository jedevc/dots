#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/vimrc $DESTINATION/.vimrc
mkdir -p $DESTINATION/.vim/swap
mkdir -p $DESTINATION/.vim/undo
cp -r $SOURCE/colors $DESTINATION/.vim

# plugins
PLUG="$DESTINATION/.vim/autoload/plug.vim"
if [ ! -f $PLUG ]; then
	curl -fLo $PLUG --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim -c 'PlugInstall|qall'

