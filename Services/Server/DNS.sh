#!/bin/bash

apt-get install bind9
apt-get install bind9utils

cat >> /etc/resolv.conf << EOF
//change 
nameserver 127.0.0.53
options edns0
search semprepingou.pt

EOF

cat > /etc/bind/named.conf.local << EOF
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
//change 
zone "semprepingou.pt" IN {
        type master;
        file "/etc/bind/forward.semprepingou.pt";
};

zone "1.168.192.in-addr.arpa" IN {
        type master;
        file "/etc/bind/reverse.semprepingou.pt";
};
EOF
touch /etc/bind/forward.semprepingou.pt
cat > /etc/bind/forward.semprepingou.pt << EOF
$TTL    86400
@       IN      SOA     linuxsv.semprepingou.pt. root.semprepingou.pt. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                          86400 )       ; Negative Cache TTL
;

//change 
@               IN      NS      linuxsv.
@               IN      A       192.168.1.2
linuxsv         IN      A       192.168.1.2
winserver       IN      A       192.168.1.1
pfSenseRio      IN      A       172.15.3.254
pfSenseLisboa   IN      A       192.168.1.254
pfSenseLondres  IN      A       172.20.27.254
@               IN      MX      10 mail.semprepingou.pt
mail            IN      A       192.168.1.2
site            IN      A       192.168.1.2
cockpit         IN      A       192.168.1.2
openfire        IN      A       192.168.1.2
EOF

touch /etc/bind/reverse.semprepingou.pt
cat > /etc/bind/reverse.semprepingou.pt << EOF
$TTL    86400
@       IN      SOA     localhost.semprepingou.pt. root.localhost.semprepingou. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                          86400 )       ; Negative Cache TTL
;

//change 
@       IN      NS      localhost.
2       IN      PTR     linuxsv.
254     IN      PTR     pfSenseLisboa.
EOF

cat > /etc/bind/named.conf.options << EOF
options {
        directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.

        forwarders {
        8.8.8.8;
        };
        allow-query {
        	//change ips
        192.182.1.0/24;
        172.20.27.0/24;
        172.15.3.0/24;	
        };

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        dnssec-validation auto;

        listen-on-v6 { any; };
};
EOF

ifconfig enp0s3 down
ifconfig enp0s3 up
service bind9 restart

clear
service bind9 status
