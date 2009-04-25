#!/bin/bash 

# read user directory
# XDG_DESKTOP_DIR = desktop directory
. ${XDG_CONFIG_HOME}/user-dirs.dirs

# icons directory
ICON_DIR=/usr/share/applications

# set PDF Viewer
PDF="AdobeReader.desktop"
[ -f ${ICON_DIR}/${PDF} ] || PDF="evince.desktop"

# set MUA
MUA="icedove.desktop"
[ -f ${ICON_DIR}/${MUA} ] || MUA="sylpheed.desktop"

# set Skype
SKYPE="skype.desktop"
[ -f ${ICON_DIR}/${SKYPE} ] || SKYPE=""

# copy icons
ICONS="${PDF} ${MUA} ${SKYPE} f-spot.desktop filezilla.desktop inkscape.desktop lxde-x-www-browser.desktop ooo-startcenter.desktop pidgin.desktop rhythmbox.desktop system-config-printer.desktop tsclient.desktop vlc.desktop"
for i in ${ICONS}; do
  [ -f ${XDG_DESKTOP_DIR}/${i} ] || cp ${ICON_DIR}/${i} ${XDG_DESKTOP_DIR}/
done

