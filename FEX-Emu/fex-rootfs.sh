#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only
# FEX's root filesystem with Mesa's overlays over it, at /run/fex-emu/rootfs, as muvm mounts it in its guest.
set -e
R=/run/fex-emu
S=/usr/share/fex-emu

if [ "$1" = stop ]; then
	umount -l "$R/rootfs" 2> /dev/null || :
	for m in "$R"/images/*; do
		[ -d "$m" ] && umount -l "$m" 2> /dev/null || :
	done
	rm -rf "$R"
	exit 0
fi

[ -f "$S/RootFS/default.erofs" ] || exit 0
mkdir -p "$R/rootfs" "$R/images"
lower=
n=0
for i in "$S"/overlays/*.erofs "$S/RootFS/default.erofs"; do
	[ -f "$i" ] || continue
	mkdir -p "$R/images/$n"
	mount -t erofs -o loop,ro "$i" "$R/images/$n"
	lower=$lower${lower:+:}$R/images/$n
	n=$((n + 1))
done
if [ "$n" = 1 ]; then
	mount --bind "$R/images/0" "$R/rootfs"
else
	mount -t overlay overlay -o "ro,lowerdir=$lower" "$R/rootfs"
fi
