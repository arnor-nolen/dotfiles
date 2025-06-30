#!/bin/sh
qemu-system-x86_64 \
    -drive file=kde.img,format=raw,index=0,media=disk \
    -m 8G \
    -enable-kvm \
    -nic user,hostfwd=tcp::60022-:22
    "$@"
