#!/bin/bash

service isc-dhcp-server stop
service bind9 stop

echo " [!] DHCP FAILOVER "
echo " [!] PING SENT TO WINDOWS SERVER "

i=1
 while [ $i -lt 2 ]
 do
 if ! ping -c 4 192.168.1.1 &>/dev/null
 then
 echo " [!] THE WINDOWS SERVER DID NOT RESPOND "
 echo " [!] STARTING FAILOVER DHCP SERVER "
 service isc-dhcp-server start 
 service bind9 start
 sleep 1

else
echo " [*] IMCP RESPONSE SUCCESSFULLY RECEIVED "
service isc-dhcp-server stop
service bind9 stop
sleep 1
fi
done

#crontab -e
#@reboot sudo /dscriptpath