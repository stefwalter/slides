#!/bin/sh

KUBECTL='kubectl --server=https://node-1.rha'

$(KUBELET) delete node node-2.rha
$(KUBELET) delete node node-3.rha
