#!/bin/ksh
#
# Time setup requires /usr/share/zoneinfo.
#

# Set the system timezone.
# /usr/share/zoneinfo and /etc/localtime files are hard-coded paths.
if [[ -n $timezone ]]; then
	msg "setting system timezone to $timezone"

	f="/usr/share/zoneinfo/$timezone"
	if [[ "$(readlink /etc/localtime)" != $f ]]; then
		ln -sf "$f" /etc/localtime
	fi
	unset f
fi

# let the kernel know if hardware clock is in utc or local time;
# also sets the kernel's timezone for jankiness like fat timestamps
case "$hwclocktz" in
utc)
	;;
localtime)
	;;
"")
	hwclocktz=utc
	;;
*)
	warn 'variable $hwclocktz not set properly, defaulting to utc'
	hwclocktz=utc
	;;
esac

msg "interpreting hardware clock as $hwclocktz"
hwclock --systz "--$hwclocktz"
