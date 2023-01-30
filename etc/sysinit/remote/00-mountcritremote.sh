#!/bin/ksh
#
# mount remote filesystems,
# possibly including /usr and other essentials.
#

msg 'mounting remote filesystems'
for i in $critfs_remote; do
	mountpoint -q "$i" || mount "$i"
done
