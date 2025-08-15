-include .github/local/Makefile.local
-include Makefile.extra

PROJECT ?= allwinner-prebuilt-extra

.DEFAULT_GOAL := all
.PHONY: all
all: build

.PHONY: devcontainer_setup
devcontainer_setup:
	sudo apt-get update
	sudo apt-get install -y dpkg-dev

#
# Test
#
.PHONY: test
test:

#
# Build
#
.PHONY: build
build:

#
# Clean
#
.PHONY: distclean
distclean: clean

.PHONY: clean
clean:

#
# Release
#
.PHONY: dch
dch: debian/changelog

.PHONY: deb
deb:
	cp *.deb ../

.PHONY: release
release:
	gh workflow run .github/workflows/new_version.yaml --ref $(shell git branch --show-current)
