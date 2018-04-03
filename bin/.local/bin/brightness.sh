#!/usr/bin/env bash

if [[ -z $2 ]]; then
    xrandr --output eDP-1 --brightness $1
else
    xrandr --output eDP-1 --brightness $1 --output HDMI-1 --brightness $2
fi
