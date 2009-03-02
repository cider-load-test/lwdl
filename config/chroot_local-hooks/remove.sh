#!/bin/bash
set -e

# disable console tty4,tty5,tty6
sed -i 's/^[456]/$&/' /etc/inittab

# parallel init script
sed -i 's/^CONCURRENCY=none/CONCURRENCY=shell/' /etc/init.d/rc
apt-get -y install insserv
update-bootsystem-insserv

# remove daemon
DAEMON="stop-bootlogd cron portmap rsyslog"
for i in $DAEMON; do /usr/sbin/update-rc.d -f $i remove; done

# install ophcrack
#aptitude update
#aptitude -y -t experimental install ophcrack ophcrack-cli

# purge packages
apt-get -y autoremove

