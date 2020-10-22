#!/bin/bash

apt-get -y install vsftpd

cat >> /etc/vsftpd.conf << EOF
write_enable=YES
ascii_upload_enable=YES
ascii_download_enable=YES
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd.chroot_list
ls_recurse_enable=YES
local_root=public_html
seccomp_sandbox=NO
EOF

