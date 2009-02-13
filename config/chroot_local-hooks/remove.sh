#!/bin/bash
set -e

# stop daemon 
DAEMON="rsyslog"
for i in $DAEMON; do /usr/sbin/update-rc.d -f $i remove; done

# disable console
sed -i 's/^[456]/$&/' /etc/inittab

# remove daemon
DAEMON="stop-bootlogd cron portmap rsyslog networking"
for i in $DAEMON; do /usr/sbin/update-rc.d -f $i remove; done

# parallel init script
sed -i 's/^CONCURRENCY=none/CONCURRENCY=shell/' /etc/init.d/rc
apt-get -y install insserv
update-bootsystem-insserv

# install ophcrack
aptitude update
aptitude -y -t experimental install ophcrack ophcrack-cli

# purge packages
apt-get -y autoremove

