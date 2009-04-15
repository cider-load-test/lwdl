#!/bin/bash -x
set -e

SKEL_DIR=/etc/skel/Desktop
ICON_DIR=/usr/share/applications
ICONS="AdobeReader.desktop evince.desktop f-spot.desktop filezilla.desktop inkscape.desktop lxde-x-www-browser.desktop ooo-startcenter.desktop opera.desktop pidgin.desktop rhythmbox.desktop skype.desktop system-config-printer.desktop totem.desktop tsclient.desktop vlc.desktop"

for i in ${ICONS}; do [ -f ${ICON_DIR}/${i} ] && cp ${ICON_DIR}/${i} ${SKEL_DIR}/ ; done
