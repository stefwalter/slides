#!/bin/sh -eu

set -x

recordmydesktop \
	-x 1680 --width 1920 --height 1080 \
	--fps 24 --freq 44100 \
	--workdir /opt/tmp \
	-o /opt/tmp/demo.ogv
