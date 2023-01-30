#!/bin/ksh
#
# set keymap
#

if [[ -n $keymap ]]; then
	msg "setting keymap to $keymap"
	loadkeys -qu "$keymap"
fi
