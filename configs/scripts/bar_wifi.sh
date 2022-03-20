#!/bin/sh

interface="wlp2s0" # replace your interface here
operstate="$(cat /sys/class/net/$interface/operstate)"

if [ "$operstate" != "up" ]; then 
    echo "  Not connected"
else
    echo "  Connected"
fi

