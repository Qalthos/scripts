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
        Ubuntu | Fedora)
            echo $lsb
            ;;
        archlinux)
            echo "Arch"
            ;;
        *)
            uname=$(uname -r)
            case $uname in
                *-amd64 | *-686-pae)
                    echo "Debian"
                    ;;
                *)
                    echo $uname
                    ;;
            esac
            ;;
    esac
fi
