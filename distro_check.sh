#!/bin/bash

if [ -e "/etc/gentoo-release" ]
then
    echo "Gentoo"

else
    lsb=$(lsb_release -si)
    case $lsb in
        Ubuntu)
            echo $lsb
            ;;
        *)
            uname=$(uname -r)
            case $uname in
                *ARCH)
                    echo "Arch"
                    ;;
                *-amd64 | *-686-pae)
                    echo "Debian"
                    ;;
                *x86_64)
                    echo "Fedora"
                    ;;
                *)
                    echo $uname
                    ;;
            esac
            ;;
    esac
fi
