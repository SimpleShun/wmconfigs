#!/bin/bash

entries="⇠ Logout\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|tofi --width 105 --height 170 --background-color '#000A' --horizontal false --anchor top-right --prompt-text "" --margin-left 0 --margin-right 8 --margin-top 47 )

case $selected in
  logout)
    swaymsg exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
#i dont think this works i just switched to wlogout
