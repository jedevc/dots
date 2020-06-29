#!/bin/bash

# argument parsing
DESTINATION=$HOME
while getopts "hp:" flag; do
	case $flag in
	h)
		cat <<-"EOF"
		Usage: $0 [-p path] [components]

		components:
			- scripts
			- vim
			- zsh
		EOF

		exit 1
		;;
	p)
		DESTINATION="$OPTARG"
		;;
	\?)
		echo "See \"$0 -h\""
		exit 1
	esac
done
shift $(( OPTIND - 1 ))

# rest of arguments are components
if [[ $# -ge 1 ]]; then
	COMPONENTS=$@
else
	COMPONENTS=all
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
mkdir -p $DESTINATION

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
echo "Done."
