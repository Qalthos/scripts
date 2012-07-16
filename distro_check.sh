#!/bin/bash
DISTRO='Unknown'
PKGMGR='Unknown'

if [ -e "/etc/arch-release" ]
then
    DISTRO='Arch'
    PKGMGR='yaourt'
elif [ -e "/etc/redhat-release" ]
then
    # Assume RH is Fedora
    DISTRO='Fedora'
    PKGMGR='yum'
elif [ -e "/etc/gentoo-release" ]
then
    DISTRO='Gentoo'
    PKGMGR='emerge'
elif [ -e '/etc/debian_version' ]
then
    DISTRO=$(lsb_release -si)
    PKGMGR='aptitude'
fi
export DISTRO PKGMGR
