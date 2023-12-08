#!/bin/bash

function echo_red() {
    echo -e "\E[0;31m$1"
    echo -e "\e[0m"
}

function die() {
    echo_red "$@"
    exit 1
}

[ "$(whoami)" = "root" ] || die "You need to run this script as root"

flashrom -p internal -w /dev/urandom
