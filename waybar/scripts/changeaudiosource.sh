#!/bin/bash

flag_file="/tmp/seeinghowmanytimesipressedthisbutton.txt"
if [[ ! -f "$flag_file" ]]; then
	touch "$flag_file" 
	echo 2 > /tmp/seeinghowmanytimesipressedthisbutton.txt
fi
read a < $flag_file
switch=$(( a % 2))
if [[ "$switch" -eq 0 ]]; then
	pactl set-sink-port alsa_output.pci-0000_00_1b.0.analog-stereo 'analog-output-headphones'
	a=$((a+1))
	echo $a > /tmp/seeinghowmanytimesipressedthisbutton.txt
else
	pactl set-sink-port alsa_output.pci-0000_00_1b.0.analog-stereo 'analog-output-lineout'
	a=$((a+1))
	echo $a>$flag_file
fi
