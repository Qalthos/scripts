#!/bin/bash

VERSIONSTRING=$(uname -r)
PACKAGEMANAGERS=( yum aptitude yaourt emerge )
PACKAGEMGR=""

function grep_uname() {
    echo ${VERSIONSTRING} | grep -Ei "${1}" >> /dev/null;
    return $?;
}


function grep_issue() {
    if [ -e /etc/issue ]; then
        cat /etc/issue | grep -Ei "${1}" >> /dev/null;
        return $?;
    else
        return 1;
    fi;
}

function distro_check() {

    # Fedora/RHEL Check
    grep_uname ".(fc|rhel)[0-9rc]+.";
    if [ $? -eq 0 ]; then
        PACKAGEMGR="yum";
	return 0;
    fi;

    grep_issue "(fedora|red hat)";
    if [ $? -eq 0 ]; then
        PACKAGEMGR="yum";
        return 0;
    fi;


    # Arch Check
    grep_uname "-ARCH";
    if [ $? -eq 0 ]; then
        PACKAGEMGR="yaourt";
        return 0;
    fi;


    # Debian/Ubuntu Check
    grep_uname "(debian|ubuntu)";
    if [ $? -eq 0 ]; then
        PACKAGEMGR="aptitude";
        return 0;
    fi;

    grep_issue "(debian|ubuntu)"
    if [ $? -eq 0 ]; then
       PACKAGEMGR="aptitude";
       return 0;
    fi;

    if [ -e /etc/debian_version ]; then
        PACKAGEMGR="aptitude";
        return 0;	
    fi;


    # Gentoo Check
    grep_uname "-gentoo-";
    if [ $? -eq 0 ]; then
        PACKAGEMGR="emerge";
        return 0;
    fi;

    grep_issue "gentoo"
    if [ $? -eq 0 ]; then
        PACKAGEMGR="emerge";
        return 0;
    fi;


    # Catch-all
    for mgr in ${PACKAGEMANAGERS}
    do
        which ${mgr}
        if [ $? -eq 0 ]; then
            PACKAGEMGR=${mgr};
            break;
        fi
    done
}

