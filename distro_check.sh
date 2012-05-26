#!/bin/bash

if [ -e "/etc/arch-release" ]
then
    echo "Arch"
elif [ -e "/etc/redhat-release" ]
then
    # Assume RH is Fedora-compatible
    echo "Fedora"
elif [ -e "/etc/gentoo-release" ]
then
    echo "Gentoo"
else
    lsb=$(lsb_release -si)
    case $lsb in
        Ubuntu | Fedora | Debian)
            echo $lsb
            ;;
        archlinux)
            echo "Arch"
            ;;
        *)
            echo $(uname -r)
            ;;
    esac
fi
