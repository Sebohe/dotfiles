#!/bin/bash

WMI=$(xinput list | grep WMI | awk '{print $5}' | awk -F"=" '{print $2}')
POWER=$(xinput list | grep Power | awk '{print $4}' | awk -F"=" '{print $2}')
TOUCH=$(xinput list | grep Touch | awk '{print $5}' | awk -F"=" '{print $2}')

#echo WMI: $WMI
#echo POWER: $POWER
#echo TOUCH: $TOUCH

if [[ $WMI ]]; then
    xinput disable $WMI
fi
if [[ $POWER ]]; then
    xinput disable $POWER
fi
if [[ $TOUCH ]]; then
    xinput disable $TOUCH
fi
