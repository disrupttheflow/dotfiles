#!/bin/sh

# Number of seconds before screen turns off
timeout=120

# Turn screen off after $timeout seconds of inactivity.
# Turn it on again when there is activity.
#
# swayidle acts like a daemon, meaning it continues execution even after
# the script is terminated, so we need to execute it in the background
# to be able to terminate it later (unless you like your screen turning
# off every 10 seconds for some reason?)
swayidle \
    timeout $timeout 'swaymsg output \* dpms off' \
    resume           'swaymsg output \* dpms on' \
    &

# Lock the screen and wait for it to be unlocked.
swaylock \
    --hide-keyboard-layout \
    --indicator-radius 100 \
    --indicator-thickness 7 \
    --ring-color cba6f7 \
    --ring-ver-color 89b4fa \
    --ring-wrong-color f38ba8 \
    --ring-clear-color a6e3a1 \
    --key-hl-color 1e1e2e \
    --bs-hl-color eba0ac \
    --text-color 11111b \
    --text-caps-lock-color 11111b \
    --line-color 00000000 \
    --line-ver-color 00000000 \
    --line-wrong-color 00000000 \
    --line-clear-color 00000000 \
    --separator-color 00000000 \
    --inside-color cba6f7 \
    --inside-ver-color 89b4fa\
    --inside-wrong-color f38ba8 \
    --inside-clear-color a6e3a1 \
    --color 1e1e2e80 \
    --clock \
    --indicator

# Screen unlocked: terminate swayidle and clean up PID
kill -TERM $!
wait
