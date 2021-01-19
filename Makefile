prepare:
	./prepare-deb-file.sh

build:
	snapcraft

install:
	sudo snap install geeteedee_*_amd64.snap --dangerous

run:
	/snap/bin/geeteedee

remove:
	sudo snap remove geeteedee

clean:
	snapcraft clean

.PHONY: prepare build install run remove clean
