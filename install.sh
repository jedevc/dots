#!/bin/bash

# help message
if [ $# -ge 1 ] && [[ $1 == '-h' ]]; then
	echo "Usage: $0 [install path] [components]"
	exit
fi

# destination
if [ -z $1 ]; then
	DESTINATION=$HOME
else
	DESTINATION=$1
	mkdir -p $DESTINATION
fi

# components
if [ -z $2 ]; then
	COMPONENTS=all
else
	COMPONENTS=${@:2}
fi

# components checker
function shouldInstall {
	if [[ $COMPONENTS == all ]]; then
		return 0
	fi

	target=$1
	for i in $COMPONENTS; do
		if [[ $i == $target ]]; then
			return 0
		fi
	done

	return 1
}

# actual install
echo "Installing '$COMPONENTS' to $DESTINATION."
if shouldInstall scripts; then
	echo "Installing scripts..."
	cp -r bin/ $DESTINATION
fi
if shouldInstall zsh; then
	echo "Installing zsh..."
	./zsh/install.sh $DESTINATION
fi
if shouldInstall vim; then
	echo "Installing vim..."
	./vim/install.sh $DESTINATION
fi
if shouldInstall x11; then
	echo "Installing x11..."
	./x11/install.sh $DESTINATION

	echo "> Setting background..."
	cp wallpaper-temple.png $DESTINATION/.wallpaper.png
	feh --bg-scale $DESTINATION/.wallpaper.png
fi
echo "Done."
