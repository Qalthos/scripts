#!/bin/bash
case $(uname -r) in
*ARCH)
    echo "Arch"
    ;;
*-amd64)
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
