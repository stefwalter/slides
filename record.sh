#!/bin/sh -eu

set -x

recordmydesktop \
	-x 1680 -y 200 --width 1024 --height 576 \
	--fps 24 --freq 44100 \
	--workdir /opt/tmp \
	--v_bitrate 2000000 \
	-o /opt/tmp/demo.ogv

# --delay 3 \
	# -x 1690 -y 30 --width 1280 --height 720 \
# ffmpeg -i cockpit-atomic-kube-2015-2.ogv -vn -c copy cockpit-atomic-kube-2015-2.ogg
