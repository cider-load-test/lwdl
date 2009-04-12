BUILDDATE := $(shell date +%Y%m%d%H%M%S)

all: build

build:
#	sudo MKSQUASHFS_OPTIONS="-b 1024k" lh_build 2>&1 | tee debian_live-buildlog.$(BUILDDATE)
#	sudo lh_build 2>&1 | tee debian_live-binary-$(BUILDDATE).buildlog
#	mv binary.img debian_live-binary-$(BUILDDATE).img
#	mv binary.list debian_live-binary-$(BUILDDATE).list
#	mv binary.packages debian_live-binary-$(BUILDDATE).packages
#	md5sum debian_live-binary-$(BUILDDATE).img > debian_live-binary-$(BUILDDATE).img.md5sum

	lh_config 
	sudo lh_build 

.PHONY: clean

clean:
	sudo lh_clean

distclean: clean
	sudo lh_clean --purge
	sudo rm -f *.iso *.list *.packages
	rm -f debian_live-buildlog.* *.md5sum
