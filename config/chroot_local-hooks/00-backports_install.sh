#!/bin/bash -x
set -e

# install package 
PACKAGES="wicd openoffice.org openoffice.orgi-help-ja openoffice.org-l10n-ja"
apt-get -y -t lenny-backports install ${PACKAGES}

# install non-free packages
apt-get -y -t lenny-backports install flashplugin-nonfree

# install restricted packages
apt-get -y -t lenny-backports install opera skype
sed -i 's/kochi/vl/' /usr/share/opera/ini/font.ini

# clean up
apt-get -y purge lxnm
