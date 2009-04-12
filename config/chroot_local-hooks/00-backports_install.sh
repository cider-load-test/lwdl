#!/bin/bash -x
set -e

# package install
PACKAGES="wicd openoffice.org"
apt-get -y -t lenny-backports install ${PACKAGES}

# non-free package
apt-get -y -t lenny-backports install flashplugin-nonfree

# clean up
apt-get -y purge lxnm
apt-get autoremove
