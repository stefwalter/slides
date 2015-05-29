#/bin/sh -eu

host_names() {
	while read address name; do
		case "$name" in
		*localhost*)
			continue
			;;
		"")
			continue
			;;
		*)
			echo $name
			;;
		esac
	done < hosts
}

setup_host() (
	cd ./stage
	find . -type f | tar -T - -cf - | ssh $1 '
		mkdir -p /var/lib/cockpit &&
		sudo mount -o remount,rw /usr &&
		sudo tar --no-overwrite-dir --no-same-owner --unlink-first -xvf - -C / &&
		sudo reboot
	'

)

hosts="$(host_names)"
cd $(dirname $0)

set -x

sudo cp hosts /etc/hosts

rm -rf ./stage
mkdir -p ./stage/etc/ssh ./stage/var/lib/cockpit ./stage/usr/share/pixmaps
cp hosts ./stage/etc
cp os-release ./stage/etc
cp system-logo-white.png ./stage/usr/share/pixmaps
ssh-keyscan $hosts > ./stage/etc/ssh/known_hosts
cp ./stage/etc/ssh/known_hosts ./stage/var/lib/cockpit/known_hosts

for host in $hosts; do
	setup_host $host
done
