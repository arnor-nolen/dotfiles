#!/bin/sh

while read -r message
do
    outputs=$(wlr-randr | awk '/^[^ ]/ {print $1}')

    for output in $outputs
    do
        echo $message
        dwlb -status $output "$message"
    done
done
