#!/bin/bash
apt install -y cowsay
apt install -y nfs-common

mkdir -p /home/nfs
mkdir -p /home/nfs/IT
mkdir -p /home/nfs/FINANCEIRA
mkdir -p /home/nfs/ADMINISTRAÇÃO

mount -t nfs 192.168.1.2:/home/nfs/FINANCEIRA /home/nfs/FINANCEIRA
mount -t nfs 192.168.1.2:/home/nfs/IT /home/nfs/IT
mount -t nfs 192.168.1.2:/home/nfs/ADMINISTRAÇÃO /home/nfs/ADMINISTRAÇÃO

clear

ls /home/nfs
sleep 1
cowsay "It FUCKING Works"
