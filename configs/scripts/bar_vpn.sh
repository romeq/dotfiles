#!/bin/sh

tun0_dir="/sys/class/net/tun0"

if [ -e "$tun0_dir" ]; then
    echo " Connected"
else
    echo " Not connected"
fi
