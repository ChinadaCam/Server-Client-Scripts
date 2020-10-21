#!/bin/bash

# client - apt-get install libpam-ldap nscd

#SERVER

	#INSTALL SERVICE


echo "[*] TYPE THE SERVER IP"
read ip;
echo "[*] THE DOMAIN eg: ldap.example.com"
read domain;

echo "[+] ADDING IP-DOMAIN TO /etc/hosts"

echo $ip $domain | sudo tee -a /etc/hosts

echo "[+] SERVICE INSTALLATION"
sudo apt update -y && apt upgrade -y
sudo apt -y install slapd ldap-utils
clear
slapcat
echo "[*] SERVICE INSTALED"

	#ADD USERS/GROUPS

touch basedn.ldif
touch ldapusers.ldif
touch ldapgroups.ldif

cat >>basedn.ldif <<EOF
dn: ou=rh,dc=ensaio,dc=reallife,dc=pt
objectClass: organizationalUnit
ou: rh
dn: ou=it,dc=ensaio,dc=reallife,dc=pt
objectClass: organizationalUnit
ou: it
EOF

cat >>ldapusers.ldif <<EOF
dn: uid=user1,ou=it,dc=ensaio,dc=reallife,dc=pt
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
cn: user1
sn: test
userPassword: {SSHA}hwedqaG1/pliHhwYrVlNVbindFpflM/j
loginShell: /bin/bash
uidNumber: 2000
gidNumber: 2000
homeDirectory: /home/user1

EOF

cat >>ldapgroups.ldif <<EOF

dn: cn=user1,ou=it,dc=ensaio,dc=reallife,dc=pt
objectClass: posixGroup
cn: user1
gidNumber: 2000
memberUid: user1


EOF

ldapadd -x -D cn=admin,dc=ensaio,dc=reallife,dc=pt -W -f basedn.ldif
ldapadd -x -D cn=admin,dc=ensaio,dc=reallife,dc=pt -W -f ldapusers.ldif
ldapadd -x -D cn=admin,dc=ensaio,dc=reallife,dc=pt -W -f ldapgroups.ldif

	#GUI INSTALLATION


sudo apt -y install apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear

sudo a2enconf php7.0-cgi
sudo  systemctl reload apache2
sudo apt -y install phpldapadmin

nano /etc/apache2/conf-enabled/phpldapadmin.conf


sudo systemctl restart apache2
sudo ufw allow proto tcp from any to any port 80,443

#fix
#/usr/share/phpldapadmin/lib/functions.php
#lines: 54,777,1083,1093

sudo apt -y install ldap-account-manager