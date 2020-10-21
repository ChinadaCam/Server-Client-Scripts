#!/bin/bash

apt-get -y install nfs-kernel-server

mkdir -m /home/nfs
mkdir -m a=rx /home/nfs/IT 
mkdir -m a=rx /home/nfs/FINANCEIRA
mkdir -m a=rwx /home/nfs/ADMINISTRACAO

cat >> /etc/exports <<EOF

/home/nfs/IT 				192.168.1.0/24(ro,no_subtree_check,sync) 172.20.27.0(ro,no_subtree_check,sync) 172.15.3.0(ro,no_subtree_check,sync)
/home/nfs/FINANCEIRA 		192.168.1.0/24(ro,no_subtree_check,sync) 172.20.27.0(ro,no_subtree_check,sync) 172.15.3.0(ro,no_subtree_check,sync)
/home/nfs/ADMINISTRACAO  	192.168.1.0/24(rw,no_subtree_check,sync) 172.20.27.0(rw,no_subtree_check,sync) 172.15.3.0(rw,no_subtree_check,sync)	
EOF

exportfs -av
exportfs 
sleep 3
/etc/init.d/nfs-kernel-server restart

clear
echo DONE!!!


