#!/bin/sh

set -x
sudo hostnamectl set-hostname 'dragon.thewalter.lan'
sudo hostnamectl set-hostname --pretty 'Dragon'
sudo rm /var/lib/cockpit/*

sudo cp ./hosts /etc/hosts
sudo cp ../files/ca.pem /etc/pki/ca-trust/source/anchors/dojo.pem
sudo update-ca-trust

scp root@fedora.system:/home/admin/.ssh/test-avc* ~/.ssh/
ssh root@fedora.system /usr/local/bin/reset.sh
ssh root@centos.system /usr/local/bin/reset.sh
ssh admin@rhel-atomic.system sudo /usr/local/bin/reset.sh

# NFS Export stuff
cp nfs-export.html demo/nfs-export.html
