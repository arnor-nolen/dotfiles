#!/bin/sh
qemu-system-x86_64 \
    -drive file=windows10.img,format=raw,index=0,media=disk,cache=none,aio=native,cache.direct=on \
    -m 8G \
    -enable-kvm \
    -smp 8,sockets=1,cores=4,threads=2 \
    -vga virtio \
    -display spice-app,gl=on \
    -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,topoext=on \
    -device virtio-serial-pci \
    -spice unix=on,addr=/tmp/vm_spice.socket,disable-ticketing=on \
    -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
    -chardev spicevmc,id=spicechannel0,name=vdagent \
    -usb \
    -usbdevice tablet \
    "$@"
