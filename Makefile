BOOTOPTION_LIVE = quiet locale=ja_JP.UTF-8 keyb=jp kmodel=jp106 vga=788
BOOTOPTION_INSTALLER = -- quiet video=vesa:ywrap,mtrr vga=788 desktop=lxde

all: config build

config: clean
	lh_config \
		--binary-filesystem fat16 \
		--binary-images usb-hdd \
		--bootappend-live "${BOOTOPTION_LIVE}" \
		--categories "main contrib non-free" \
		--distribution lenny \
		--keyring-packages "debian-backports-keyring debian-multimedia-keyring" \
		--linux-flavours 686 \
		--linux-packages "linux-image-2.6 aufs-modules-2.6" \
		--packages "usplash-theme-crunchybranch" \
		--packages-lists "lxde 01-system 10-packages 40-rescuetools 50-japanese 60-restricted"

build: 
	sudo lh_build 

clean:
	sudo lh_clean

distclean: clean
	sudo lh_clean --purge
	sudo rm -f *.iso *.img *.list *.packages *.buildlog *.md5sum

