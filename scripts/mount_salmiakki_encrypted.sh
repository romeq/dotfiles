#!/bin/sh

uid=$(id -u "$USER")
if [ "$uid" -gt 0 ]; then
    echo "warning: not root" > /dev/stderr
elif [ $# -lt 1 ]; then
    echo "usage: $0 <mount [device (default: /dev/sdb2)] / unmount>"
    exit 2
fi

device="$2"
[ -z "$device" ] && device="/dev/sdb2"
decrypted_mount_path="/dev/mapper/salmiakki_encrypted"
mntpath="/mnt/salmiakki_s"

if [ "$1" = "mount" ]; then
    mkdir -p "$mntpath"

    if [ ! -e "$device" ] || [ ! -b "$device" ]; then
        echo "device doesn't exist or is not a block device" > /dev/stderr
        exit 1

    elif [ -n "$(find $mntpath -mindepth 1 -maxdepth 1)" ]; then
        echo "mount path '$mntpath' is not empty." > /dev/stderr
        exit 1

    fi

    cryptsetup open "$device" salmiakki_encrypted
    mount "$decrypted_mount_path" "$mntpath"

elif [ "$1" = "unmount" ]; then
    cryptsetup close salmiakki_encrypted
fi
