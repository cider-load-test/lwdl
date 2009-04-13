#!/bin/bash -x
set -e

# install package 
PACKAGES="wicd openoffice.org openoffice.org-help-ja openoffice.org-l10n-ja openoffice.org-gtk openoffice.org-pdfimport openoffice.org-presentation-minimizer openoffice.org-presenter-console openoffice.org-filter-binfilter openoffice.org-report-builder"
apt-get -y -t lenny-backports install ${PACKAGES}

# install non-free packages
apt-get -y -t lenny-backports install flashplugin-nonfree

# install restricted packages
apt-get -y -t lenny-backports install opera skype
sed -i 's/kochi/vl/' /usr/share/opera/ini/font.ini
/usr/sbin/update-alternatives --set x-www-browser /usr/bin/iceweasel

# clean up
apt-get -y purge lxnm
