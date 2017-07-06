#!/bin/bash
DISTRO='Unknown'
PKGMGR='Unknown'
PKG_OPTS=''

if [ `uname` = 'Linux' ]
then
    if [ -e "/etc/arch-release" ]
    then
        DISTRO='Arch'
        if [ -e "/usr/bin/pacaur" ]
        then
            PKGMGR='pacaur'
        elif [ -e "/usr/bin/yaourt" ]
        then
            PKGMGR='yaourt'
            PKG_OPTS='--aur --devel'
        elif [ -e "/usr/bin/packer" ]
        then
            PKGMGR='packer'
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
    elif [ `lsb_release -si` = 'openSUSE' ]
        DISTRO=$(lsb_release -si)
        PKGMGR='zypper'
    then
    fi
elif [ `uname` = 'Darwin' ]
then
    DISTRO='Darwin'
    if [ -e "/usr/local/bin/brew" ]
    then
    	PKGMGR='brew'
    fi
fi
export DISTRO PKGMGR
