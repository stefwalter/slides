#!/bin/sh -eu

set -x

recordmydesktop \
	-x 1700 -y 40 --width 1600 --height 900 \
	--fps 24 --freq 44100 \
	--workdir /opt/tmp \
	-o /opt/tmp/demo.ogv
