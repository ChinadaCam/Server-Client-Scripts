#!/bin/bash
apt-get -y install samba 

mkdir /home/samba
mkdir /home/samba/CIBER 
mkdir /home/samba/SEGURANCA 
mkdir /home/samba/LINUX 

cat >> /etc/samba/smb.conf <<EOF
	
[CIBER]
comment = Samba
path = /home/partilha/CIBER
guest = ok
writeable = yes

[SEGURANCA]
comment = Samba
path = /home/partilha/SEGURANCA
guest = ok
writeable = yes
invalid users = Maria

[LINUX]
comment = Samba
path = /home/partilha/LINUX
guest = ok
EOF

chmod u=rwx,g=rwx /home/samba/CIBER
chmod u=rwx,g=rwx /home/samba/SEGURANCA
chmod u=rx,g=rx /home/samba/LINUX

service smbd restart
service nmbd restart

#change users 

smbpasswd -a Maria 
smbpasswd -a Iolanda
smbpasswd -a Vitor 
smbpasswd -a Alexandra 
smbpasswd -a Francisco 

clear
echo Done!!!