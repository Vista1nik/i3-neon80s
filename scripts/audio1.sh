#!/usr/bin/env bash

################################
# Shows info about sound/volume.
# Allows simple volume controls.
#
# Thanks to [@EliteTK](https://gist.github.com/EliteTK/36d061fa24372fb70312),
# for the big speed gain when switching to `ponymix`
#
# Dependencies:
# - ponymix
################################

full=""
short=""
color=""
status=0

step=${BLOCK_INSTANCE:-5}


getVolume() {
	ponymix get-volume
}


isMuted() {
	ponymix is-muted
}


case $BLOCK_BUTTON in

	# right click
	# mute/unmute
	3) ponymix toggle >/dev/null ;;

	# scroll up
	# raise volume
	4) ponymix increase $step >/dev/null ;;

	# scroll down
	# lower volume
	5) ponymix decrease $step >/dev/null ;;

esac


vol=`getVolume`

# determine icon
if [ $vol -eq 0 ]; then
	icon=""
else
	if [ $vol -le 33 ]; then
		icon=""
	else
		icon=""
	fi
fi

# determine mute status
if isMuted; then
	color="#ff0000"
	status=33
fi

full="$icon $vol%"
short="$vol"


echo $full
echo $short
echo $color
exit $status