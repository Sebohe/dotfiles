#!/bin/sh

export MONITOR=$(xrandr | grep HDMI | awk '{print $1}')
export LAPTOP=$(xrandr | grep eDP | awk '{print $1}')


if [[ $(xrandr | grep HDMI | grep disconnected) ]]; then
    xrandr --output MONITOR --off
fi

if [[ $(xrandr | grep HDMI | grep 1080) ]]; then
        xrandr --output $MONITOR --mode 1920x1080 --pos 1920x0 --rotate normal --output VIRTUAL1 --off --output $LAPTOP --mode 1920x1080 --pos 0x0 --rotate normal
fi

if [[ $(xrandr | grep HDMI | grep 1050) ]]; then
        xrandr --output $MONITOR --mode 1680x1050 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output $LAPTOP --mode 1920x1080 --pos 1680x0 --rotate normal
fi
