#!/bin/bash

if [ -e "/etc/gentoo-release" ]
then
    echo "Gentoo"

else
    uname=$(uname -r)
    case $uname in
        *ARCH)
            echo "Arch"
            ;;
        *-amd64 | *-686-pae)
            echo "Debian"
            ;;
        *-generic)
            echo "Ubuntu"
            ;;
        *x86_64)
            echo "Fedora"
            ;;
        *)
            echo $uname
            ;;
    esac
fi
