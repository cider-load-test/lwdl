#!/bin/bash -x
set -e

# install wicd
apt-get -y install wicd
apt-get -y purge lxnm

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
DAEMON="cron portmap rsyslog partimaged ssh"
for i in $DAEMON; do update-rc.d -f $i remove; done

# remove packages
apt-get -y autoremove

# enable insserv
update-bootsystem-insserv

# prelink
prelink -afmR

