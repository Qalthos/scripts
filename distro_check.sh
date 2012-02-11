#!/bin/bash
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
*-gentoo|*-gentoo-r*)
    echo "Gentoo"
    ;;
*x86_64)
    echo "Fedora"
    ;;
*)
    echo $(uname -r)
    ;;
esac
