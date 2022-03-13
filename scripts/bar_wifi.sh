#!/bin/sh

operstate="$(cat /sys/class/net/wlan0/operstate)"

if [ "$operstate" != "up" ]; then 
    echo "  Not connected"
else
    echo "  Connected"
fi

