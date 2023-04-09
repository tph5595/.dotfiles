#!/bin/bash
# systemctl --user stop pulseaudio.socket
# systemctl --user stop pulseaudio.service
# while [ 1 ]
# do
      # /usr/bin/jackd -dalsa -r44100 -p1024 -n2 -D -Chw:USB -Phw:S2
      # pactl load-module module-jack-sink channels=2; pactl load-module module-jack-source channels=2; pacmd set-default-sink jack_out
# done
/usr/bin/jackd -dalsa -r44100 -p1024 -n2 -D -Chw:USB -Phw:S2 &
pactl load-module module-jack-sink channels=2; pactl load-module module-jack-source channels=2; pacmd set-default-sink jack_out
# Setup Scarlett ouputs
alsa_out -d hw:$(cat /proc/asound/cards | grep "USB-Audio - Scarlett" | cut -d' ' -f2) &
alsa_out -d hw:$(cat /proc/asound/cards | grep "Schiit" | cut -d' ' -f2) &
qjackctl &
