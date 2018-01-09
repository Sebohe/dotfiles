#!/bin/bash

WMI=$(xinput list | grep WMI | awk '{print $5}' | awk -F"=" '{print $2}')
POWER=$(xinput list | grep Power | awk '{print $4}' | awk -F"=" '{print $2}')
TOUCH=$(xinput list | grep Touch | awk '{print $5}' | awk -F"=" '{print $2}')

#echo WMI: $WMI
#echo POWER: $POWER
#echo TOUCH: $TOUCH

xinput disable $WMI
xinput disable $POWER
xinput disable $TOUCH
