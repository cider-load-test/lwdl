#!/bin/bash -x
set -e

PACKAGES="flashplugin-nonfree jd wicd \
openoffice.org openoffice.org-gnome ttf-opensymbol \
openoffice.org-help-ja openoffice.org-l10n-ja \
openoffice.org-pdfimport openoffice.org-ogltrans \
openoffice.org-presentation-minimizer openoffice.org-presenter-console \
openoffice.org-filter-binfilter openoffice.org-report-builder \
openoffice.org-filter-mobiledev"
apt-get -y -t lenny-backports install ${PACKAGES}
apt-get -y purge lxnm

# install restricted packages
# apt-get -y install opera skype
# [ -f /usr/share/opera/ini/font.ini ] && sed -i 's/kochi/vl/' /usr/share/opera/ini/font.ini
# /usr/sbin/update-alternatives --set x-www-browser /usr/bin/iceweasel

apt-get -y -t lenny-backports dist-upgrade

