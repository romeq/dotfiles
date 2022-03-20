#!/bin/sh

uid=$(id -u "$USER")
if [ "$uid" -gt 0 ]; then
    echo "warning: not root" > /dev/stderr
elif [ $# -lt 1 ]; then
    echo "usage: $0 <mount [device] / unmount>"
    exit 2
fi

device="$2"
[ -z "$device" ] && device="/dev/sdb1"

mntpath="/mnt/salmiakki"

if [ "$1" = "mount" ]; then
    mkdir -p "$mntpath"

    if [ ! -e "$device" ] || [ ! -b "$device" ]; then
        echo "device doesn't exist or is not a block device" > /dev/stderr
        exit 1

    elif [ -n "$(find $mntpath -mindepth 1 -maxdepth 1)" ]; then
        echo "mount path '$mntpath' is not empty." > /dev/stderr
        exit 1

    fi

    mount $device "$mntpath"

elif [ "$1" = "unmount" ]; then
    umount "$device"
fi
