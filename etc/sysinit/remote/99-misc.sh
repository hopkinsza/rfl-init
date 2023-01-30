#!/bin/ksh

if [[ ! -e /var/log/wtmp ]]; then
		install -m0664 -o root -g utmp /dev/null /var/log/wtmp
fi
if [[ ! -e /var/log/btmp ]]; then
		install -m0664 -o root -g utmp /dev/null /var/log/btmp
fi

# dirs for X
install -d -m1777 /tmp/.X11-unix /tmp/.ICE-unix

rm -f /etc/nologin
