#!/bin/bash

SOURCE=`dirname $0`
DESTINATION="$1"

cp $SOURCE/vimrc $DESTINATION/.vimrc
mkdir -p $DESTINATION/.vim/swap
mkdir -p $DESTINATION/.vim/undo

# plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall|qall'
