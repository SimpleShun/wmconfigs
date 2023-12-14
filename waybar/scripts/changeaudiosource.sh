#!/bin/bash

flag_file="/tmp/seeinghowmanytimesipressedthisbutton.txt"
if [[ ! -f "$flag_file" ]]; then
	touch "$flag_file" 
	echo 2 > /tmp/seeinghowmanytimesipressedthisbutton.txt
fi
read a < $flag_file
switch=$(( a % 2))
if [[ "$switch" -eq 0 ]]; then
	pactl set-sink-port @DEFAULT_SINK@ 'analog-output-headphones'
	a=$((a+1))
	echo $a > /tmp/seeinghowmanytimesipressedthisbutton.txt
else
	pactl set-sink-port @DEFAULT_SINK@ 'analog-output-lineout'
	a=$((a+1))
	echo $a>$flag_file
fi
