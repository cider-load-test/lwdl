#!/bin/bash -x
set -e

# install backported package 
PACKAGES="wicd openoffice.org-pdfimport openoffice.org-presentation-minimizer openoffice.org-presenter-console openoffice.org-filter-binfilter openoffice.org-report-builder"
apt-get -y -t lenny-backports dist-upgrade
apt-get -y -t lenny-backports install ${PACKAGES}

# install backported non-free packages
apt-get -y -t lenny-backports install flashplugin-nonfree

# install restricted packages
# apt-get -y install opera skype
sed -i 's/kochi/vl/' /usr/share/opera/ini/font.ini
/usr/sbin/update-alternatives --set x-www-browser /usr/bin/iceweasel

# clean up
apt-get -y purge lxnm
