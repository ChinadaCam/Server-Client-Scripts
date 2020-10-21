#!/bin/bash

apt-get install tightvncserver XFCE4 XFCE4-goodies 
vncpasswd

cat >  ~/.vnc/xstartup  << EOF
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
startxfce4 &
EOF

chmod +x ~/.vnc/xstartup
vncserver 
sleep 2

ss -ltn 
sleep 2

ufw allow from any to any port 5901 proto tcp
sleep 1