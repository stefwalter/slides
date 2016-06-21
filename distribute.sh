#!/bin/sh
set -euf

dir=$(mktemp -d dist.XXXXXX)
base=$(basename $1)

tar -cvf - --exclude='*.ogv' --exclude='*.webm' reveal $1 | tar -C $dir -xf -
sed -i "s|data-background-video=.|\0https://rawgit.com/stefwalter/cockpit-slides/master/$base/|" $dir/$1/index.html

cat > $dir/README.txt <<EOF
These are slides in HTML format.

Load $base/index.html in your browser, or use the following
command in a terminal:

    $ firefox $base/index.html

You can also access these slides at:

https://rawgit.com/stefwalter/cockpit-slides/master/$base/

EOF

(cd $dir && rm -f ../$base.zip && zip -r ../$base.zip reveal $1 README.txt)
rm -r $dir
