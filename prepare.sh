#!/bin/sh

sudo brctl addbr eth5
sudo brctl addbr eth6
sudo virsh net-destroy cockpit
sudo virsh net-destroy cockpit1

