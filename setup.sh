#/bin/sh -eu

setup_host() (
	cd ./stage
	find . -type f | tar -T - -cf - | ssh $1 '
		mkdir -p /var/lib/cockpit;
		sudo systemctl enable kubelet kube-proxy docker;
		sudo mount -o remount,rw /usr;
		sudo tar --no-overwrite-dir --no-same-owner --unlink-first -xvf - -C / &&
		sudo reboot
	'
)

hosts="$(sed -nr 's/.*\s([a-z0-9.-]+)$/\1/p' /etc/hosts | grep -v localhost)"
cd $(dirname $0)

set -x

sudo cp hosts /etc/hosts
sudo route add -net 10.254.0.0/16 gw node-1.rha
cp -v k8s-*.json ~/Desktop

rm -rf ./stage
mkdir -p ./stage/etc/ssh ./stage/etc/selinux ./stage/etc/kubernetes ./stage/var/lib/cockpit ./stage/usr/share/pixmaps
cp hosts ./stage/etc
cp os-release ./stage/etc
cp selinux ./stage/etc/selinux/config
cp system-logo-white.png ./stage/usr/share/pixmaps
cp config proxy kubelet ./stage/etc/kubernetes
ssh-keyscan $hosts > ./stage/etc/ssh/known_hosts
cp ./stage/etc/ssh/known_hosts ./stage/var/lib/cockpit/known_hosts

for host in $hosts; do
	setup_host $host
done

