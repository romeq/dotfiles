#!/bin/sh

uid=$(id -u "$USER")
if [ "$uid" -gt 0 ]; then
    echo "warning: not root" > /dev/stderr
    exit 1
elif [ $# -lt 1 ]; then
    echo "usage: $0 <mount [device (default: /dev/sdb2)] / eject>"
    exit 2
fi

device="$2"
[ -z "$device" ] && device="/dev/sdb2"
decrypted_mount_path="/dev/mapper/salmiakkide"
mntpath="/mnt/salmiakkide"

if [ "$1" = "mount" ]; then
    mkdir -p "$mntpath"

    if [ ! -e "$device" ] || [ ! -b "$device" ]; then
        echo "device doesn't exist or is not a block device" > /dev/stderr
        exit 1

    elif [ -n "$(find $mntpath -mindepth 1 -maxdepth 1)" ]; then
        echo "mount path '$mntpath' is not empty." > /dev/stderr
        exit 1

    fi

    if ! cryptsetup open "$device" salmiakkide; then
        exit 1
    fi
    if ! mount "$decrypted_mount_path" "$mntpath"; then
        exit 1
    fi

elif [ "$1" = "eject" ]; then
    if ! umount /mnt/salmiakkide; then
        exit 1
    fi
    if ! cryptsetup close salmiakkide; then
        exit 1
    fi
else
    echo "unknown option \"$1\"" 2>/dev/stderr
fi
