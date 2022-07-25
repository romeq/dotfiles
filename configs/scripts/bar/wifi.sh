#!/bin/sh

interface="wlo1" # replace your interface here
operstate="$(cat /sys/class/net/$interface/operstate)"

if [ "$operstate" != "up" ]; then 
    echo "睊 Off"
else
    echo "  Wi-Fi"
fi

