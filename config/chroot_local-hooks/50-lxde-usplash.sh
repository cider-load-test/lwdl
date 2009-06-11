#!/bin/sh
set -e

# set usplash screen theme CrunchyBranch

[ -f /usr/lib/usplash/CrunchyBranch.so ] || exit 0

/usr/sbin/update-alternatives --set usplash-artwork.so /usr/lib/usplash/CrunchyBranch.so

