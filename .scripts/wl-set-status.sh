#!/bin/sh

while read -r message
do
    outputs=$(wlr-randr | awk '/^[^ ]/ {printf $1}')

    for output in $outputs
    do
        dwlb -status $output $message
    done
done
