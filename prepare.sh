#!/bin/sh

sudo hostnamectl set-hostname 'falcon.thewalter.lan'
sudo hostnamectl set-hostname --pretty 'Falcon'
sudo brctl addbr eth5
sudo brctl addbr eth6
# sudo virsh net-destroy cockpit
# sudo virsh net-destroy cockpit1
sudo rm /var/lib/cockpit/*

