sysinit
=======

This directory contains the initscripts proper for rift linux,
run once at system boot.

There are 3 stages.

base
----

Things to be done with only the root partition mounted --
which includes `/etc`, `/bin`, `/sbin`, and `/lib`.

local
-----

Mount filesystems in `$critfs_local`.
This is often just `/var`;
`dhcpcd` needs it, and the random seed is stored in `/var/db/random-seed`.

Then load the random seed and bring up the network with `/etc/netstart`.

`/etc/netstart` can be a no-op if you don't have any critical filesystems
mounted over the network;
you can set it up later, such as in `/etc/rc.local`.

remote
------

Mount filesystems in `$critfs_remote`.
This may include `/usr` and `/home`.

Finish startup tasks that require `/usr`.

Finally, mount all remaining filesystems not marked `noauto` in `/etc/fstab`
with `mount -a`.
It is highly recommended that you mark all filesystems as `noauto`
except those you intend to be mounted at this point.
