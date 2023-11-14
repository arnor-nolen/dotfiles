#!/bin/sh

if [ -f /opt/sdk/qnx710/qnxsdp-env.sh ]
then
    source /opt/sdk/qnx710/qnxsdp-env.sh
    clangd --query-driver=/opt/sdk/qnx710/host/linux/x86_64/usr/bin/*g++
else
    clangd
fi
