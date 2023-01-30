#!/bin/ksh
#
# fsck /, or skip if $fsck_root is 'no'.
#

# default $fsck_root to yes
if [[ -z $fsck_root ]]; then
	fsck_root=yes
fi

if yesno fsck_root; then
	msg 'fsck rootfs'

	msg2 'mounting / read-only'
	mount -o remount,ro /

	msg2 'fsck'
	fsck -p /

	msg2 'mounting / read-write'
	mount -o remount,rw /
fi
