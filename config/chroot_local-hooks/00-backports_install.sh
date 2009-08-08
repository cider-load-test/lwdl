#!/bin/bash -x
set -e

PACKAGES="flashplugin-nonfree wicd pidgin acpid \
openoffice.org openoffice.org-gtk ttf-opensymbol \
openoffice.org-help-ja openoffice.org-l10n-ja \
openoffice.org-pdfimport openoffice.org-ogltrans \
dictionaries-common"
apt-get -y -t lenny-backports install ${PACKAGES}
apt-get -y purge lxnm

# install restricted packages
# apt-get -y install opera skype
# [ -f /usr/share/opera/ini/font.ini ] && sed -i 's/kochi/vl/' /usr/share/opera/ini/font.ini
# /usr/sbin/update-alternatives --set x-www-browser /usr/bin/iceweasel

# apt-get -y -t lenny-backports dist-upgrade

