#!/bin/sh

if [[ $(xrandr | grep HDMI | grep 1080) ]]; then
    xrandr --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate normal --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal
fi


if [[ $(xrandr | grep HDMI | grep 1050) ]]; then
    xrandr --output HDMI1 --mode 1680x1050 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 1680x0 --rotate normal

fi
