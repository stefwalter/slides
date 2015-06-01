#!/bin/sh

HOSTS="$(sed -nr 's/.*\s([a-z0-9.-]+)$/\1/p' /etc/hosts | grep -v localhost)"
cd $(dirname $0)

set -x

SCRIPT="
set -ex
systemctl stop etcd kube-apiserver kube-scheduler kube-controller-manager kubelet kube-proxy
rm -rf /var/lib/etcd/*
docker ps -qa | xargs -n 1 docker rm -f
"

for HOST in $HOSTS; do
	echo "$SCRIPT" | ssh $HOST sudo sh -s
done


# Reinitialize the master
for HOST in $HOSTS; do
	ssh $HOST sudo systemctl start etcd kube-apiserver
	sleep 1
	kubectl --server=http://$HOST:8080 create -f node.json
	curl -L http://$HOST:2379/v2/keys/coreos.com/network/config -XPUT --data-urlencode value@flannel-config.json
	break
done
