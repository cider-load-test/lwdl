#!/bin/bash -x
set -e

# disable console tty2,tty3,tty4,tty5,tty6
sed -i 's/^[23456]/#\ &/' /etc/inittab

# enable parallel init script
sed -i 's/^CONCURRENCY=none/CONCURRENCY=startpar/' /etc/init.d/rc

# remove daemon
DAEMON="cron portmap rsyslog partimaged ssh timidity saned acct clamav-freshclam system-tools-backends timidity rsync"
for i in $DAEMON; do update-rc.d -f $i remove; done

# remove packages
apt-get clean --yes
apt-get autoremove --yes
dpkg -P `dpkg -l | grep ^rc | cut -d' ' -f 3`

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

# prelink
prelink -afmR

