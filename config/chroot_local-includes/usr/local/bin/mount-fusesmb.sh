#!/bin/bash

# read user directory
# XDG_DESKTOP_DIR = desktop directory
. ${XDG_CONFIG_HOME}/user-dirs.dirs

# set permission
FUSESMBCONF=${HOME}/.smb/fusesmb.conf
if [ ! -f ${FUSESMBCONF} ]; then
  mkdir -p ${HOME}/.smb/
  cp -f /usr/share/doc/fusesmb/examples/fusesmb.conf.ex ${FUSESMBCONF}
fi
/bin/chmod 600 ${FUSESMBCONF}

# check mount directory
SMBMOUNTDIR=${XDG_DESKTOP_DIR}/WindowsNetwork
[ -d ${SMBMOUNTDIR} ] || mkdir -p "${SMBMOUNTDIR}"

# mount fusesmb
[ -n "`mount | grep fusesmb`" ] || /usr/bin/fusesmb "${SMBMOUNTDIR}"
