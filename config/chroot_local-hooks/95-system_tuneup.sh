#!/bin/bash -x
set -e

# # set debconf dash/insserv
# debconf-set-selections << EOL
# dash dash/sh boolean true 
# insserv insserv/enable boolean true
# EOL
#
# # reconfigureing dash
# dpkg-reconfigure --frontend=dialog --priority=low dash 

# disable console tty2,tty3,tty4,tty5,tty6
sed -i 's/^[23456]/#\ &/' /etc/inittab

# enable parallel init script
sed -i 's/^CONCURRENCY=none/CONCURRENCY=startpar/' /etc/init.d/rc

# remove daemon
DAEMON="cron portmap rsyslog partimaged ssh timidity saned"
for i in $DAEMON; do update-rc.d -f $i remove; done

# remove packages
apt-get clean --yes
apt-get autoremove --yes || true

# Removing unused files
find . -name *~ | xargs rm -f

rm -f /var/lib/apt/lists/*Release*
rm -f /var/lib/apt/lists/*Sources*
rm -f /var/lib/apt/lists/*Packages*

# Truncating logs
for FILE in $(find /var/log/ -type f)
do
        : > ${FILE}
done

# enable insserv
#update-bootsystem-insserv

# prelink
prelink -afmR

