VERSION = $(shell git tag -l | tail -n1)
NAME=nemo-kickstarter-configs

all:

install:
	mkdir -p $(DESTDIR)/usr/share/kickstarter-configs/nemo/adaptations  
	mkdir -p $(DESTDIR)/usr/share/kickstarter-configs/nemo/base
	mkdir -p $(DESTDIR)/usr/share/kickstarter-configs/nemo/release-latest
	mkdir -p $(DESTDIR)/usr/share/kickstarter-configs/nemo/release-next
	mkdir -p $(DESTDIR)/usr/share/kickstarter-configs/nemo/scripts
	cp adaptations/* $(DESTDIR)/usr/share/kickstarter-configs/nemo/adaptations/
	cp base/* $(DESTDIR)/usr/share/kickstarter-configs/nemo/base/
	cp release-latest/* $(DESTDIR)/usr/share/kickstarter-configs/nemo/release-latest/
	cp release-next/* $(DESTDIR)/usr/share/kickstarter-configs/nemo/release-next/
	cp scripts/* $(DESTDIR)/usr/share/kickstarter-configs/nemo/scripts/

clean:
	rm */*~

release:
	git archive --format=tar --prefix=${NAME}-${VERSION}/ ${VERSION} | xz -z > ${NAME}-${VERSION}.tar.xz

