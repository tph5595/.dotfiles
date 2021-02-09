#!/bin/sh
feh --bg-fill ~/Pictures/bg.jpeg
setxkbmap -layout us -variant dvp
xrandr --output DP-0 --mode 2560x1440 --rate 144.00
pactl set-default-sink alsa_output.usb-Schiit_Audio_Schiit_USB_Audio_Gen_2-00.analog-stereo
pactl set-default-source alsa_output.usb-Schiit_Audio_Schiit_USB_Audio_Gen_2-00.analog-stereo.monitor
compton --backend glx --paint-on-overlay --vsync opengl-swc
