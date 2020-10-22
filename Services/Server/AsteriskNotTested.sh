#!/bin/bash
apt-get install asterisk

cat >> /etc/aserisk/sip.conf <<EOF

[Maria]
type=friend
port=5060
username=Maria
nat=yes
quality=yes
regcontext=1
context=from-internal

[Iolanda]
type=friend
port=5060
username=Iolanda
nat=yes
quality=yes
regcontext=2
context=from-internal

[Vitor]
type=friend
port=5060
username=Vitor
nat=yes
quality=yes
regcontext=3
context=from-internal

[Alexandra]
type=friend
port=5060
username=Alexandra
nat=yes
quality=yes
regcontext=4
context=from-internal

[Francisco]
type=friend
port=5060
username=Francisco
nat=yes
quality=yes
regcontext=5
context=from-internal
EOF

cat >> /etc/asterisk/user.conf <<EOF

[Maria]
full name = Maria
secret = Catota420
hassip = yes
context = from-internal
host = dynamic

[Iolanda]
full name = Iolanda
secret = Catota420
hassip = yes
context = from-internal
host = dynamic

[Vitor]
full name = Vitor
secret = Catota420
hassip = yes
context = from-internal
host = dynamic

[Alexandra]
full name = Alexandra
secret = Catota420
hassip = yes
context = from-internal
host = dynamic

[Francisco]
full name = Francisco
secret = Catota420
hassip = yes
context = from-internal
host = dynamic
EOF

cat >> /etc/asterisk/extenssions.conf << EOF
[from-internal]
exten=>001,1,Dial(SIP/Maria,20)
exten=>Maria,1,Dial(SIP/Maria,20)
exten=>Maria,2,Playback(vm-nobodyavail)

exten=>002,1,Dial(SIP/Iolanda,20)
exten=>Iolanda,1,Dial(SIP/Iolanda,20)
exten=>Iolanda,2,Playback(vm-nobodyavail)

exten=>003,1,Dial(SIP/Vitor,20)
exten=>Vitor,1,Dial(SIP/Vitor,20)
exten=>Vitor,2,Playback(vm-nobodyavail)

exten=>004,1,Dial(SIP/Alexandra,20)
exten=>Alexandra,1,Dial(SIP/Alexandra,20)
exten=>Alexandra,2,Playback(vm-nobodyavail)

exten=>005,1,Dial(SIP/Francisco,20)
exten=>Francisco,1,Dial(SIP/Francisco,20)
exten=>Francisco,2,Playback(vm-nobodyavail)

exten=>999,1,Dial(SIP/Maria&SIP/Iolanda&SIP/Vitor&SIP/Alexandra&SIP/Francisco,20)
EOF

service asterisk restart

clear
service asterisk status
echo "DONE!!!"


