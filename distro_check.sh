#!/bin/bash

if [ -e "/etc/gentoo-release" ]
then
     echo "Gentoo"
fi

case $(uname -r) in
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
    echo $(uname -r)
    ;;
esac
