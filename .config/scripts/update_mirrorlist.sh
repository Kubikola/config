#!/bin/sh
reflector --age 8 --fastest 128 --latest 64 --number 32 --sort rate --save /etc/pacman.d/mirrorlist
rm /etc/pacman.d/mirrorlist.pacnew &> /dev/null

