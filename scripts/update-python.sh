#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "Usage: $0 <python_version>."
    exit 1
fi

yay -S --answerclean=All --noconfirm $(yay -Qoq /usr/lib/python$1)
