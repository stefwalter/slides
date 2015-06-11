#!/bin/sh -eu

set -x

recordmydesktop \
	-x 1700 -y 150 --width 1600 --height 900 \
	--fps 24 --freq 44100 \
	--workdir /opt/tmp \
	-o /opt/tmp/demo.ogv

# ffmpeg -i cockpit-atomic-kube-2015-2.ogv -vn -c copy cockpit-atomic-kube-2015-2.ogg
