#!/bin/bash
DISTRO='Unknown'
PKGMGR='Unknown'

if [ -e "/etc/arch-release" ]
then
    DISTRO='Arch'
    if [ -e "/usr/bin/yaourt" ]
    then
        PKGMGR='yaourt'
    else
        PKGMGR='pacman'
    fi
elif [ -e "/etc/redhat-release" ]
then
    # Assume RH is Fedora
    DISTRO='Fedora'
    if [ -e "/usr/bin/dnf" ]
    then
        PKGMGR='dnf'
    else
        PKGMGR='yum'
    fi
elif [ -e "/etc/gentoo-release" ]
then
    DISTRO='Gentoo'
    PKGMGR='emerge'
elif [ -e '/etc/debian_version' ]
then
    DISTRO=$(lsb_release -si)
    if [ -e "/usr/bin/aptitude" ]
    then
        PKGMGR='aptitude'
    else
        PKGMGR='apt-get'
    fi
elif [ `uname` = 'Darwin' ]
then
    if [ -e "/usr/local/bin/brew" ]
    then
    	DISTRO='Darwin'
    	PKGMGR='brew'
    fi
fi
export DISTRO PKGMGR
