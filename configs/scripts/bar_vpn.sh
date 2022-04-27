#!/bin/sh

tun0_dir="/sys/class/net/tun0"

if [ -e "$tun0_dir" ]; then
    echo " VPN"
else
    echo " VPN"
fi
