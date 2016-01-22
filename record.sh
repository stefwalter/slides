#!/bin/sh -eu

set -x

X=1680
Y=200

W=640
H=480
#W=800
#H=600
W=1024
H=768

# recordmydesktop -x $X -y $Y --width $W --height $H --v_bitrate 2000000 \
#	--fps 24 --freq 44100  --workdir /opt/tmp -o ./demo.ogv

# Build with https://github.com/stefwalter/byzanz
# * No loops
# * Handle Ctrl-C right
byzanz-record --cursor --x=$X --y=$Y --width=$W --height=$H --duration=1500000 ./demo.webm
