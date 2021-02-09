#!/bin/bash
/usr/bin/jackd -dalsa -r44100 -p1024 -n2 -D -Chw:USB -Phw:S2 &
pactl load-module module-jack-sink channels=2; pactl load-module module-jack-source channels=2; pacmd set-default-sink jack_out
