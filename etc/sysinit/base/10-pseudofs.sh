#!/bin/ksh
#
# mount pseudo-filesystems given in $pseudofs;
# must be present in /etc/fstab
#

msg 'mounting pseudo-filesystems'

if [[ -n $pseudofs ]]; then
	for i in $pseudofs; do
		mkdir -p $i
		mountpoint -q $i || mount $i
	done
fi
