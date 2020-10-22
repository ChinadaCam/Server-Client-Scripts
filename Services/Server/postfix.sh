#!/bin/bash

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"


echo "$COL_BLUE POSTFIX SCRIPT $COL_RESET"
select opt in  Install-Postfix Install-ssl Uninstall QUIT; do


		case $opt in

			Install-Postfix )
				{

				

				apt-get -y install postfix
				dpkg-reconfigure postfix
				
				cat >> /etc/postfix/main.cf <<EOF
				home_mailbox = Maildir/
				resolve_numeric_domain = yes 
EOF
				
				apt-get -y install mailutils
				apt-get -y install courier-imap
				
				maildirmake /etc/skel/Maildir
				
				/etc/init.d/courier-imap restart
				/etc/init.d/courier-authdaemon restart
				/etc/init.d/postfix restart
				
				clear
				
				
				service postfix status
				tail -15 /etc/postfix/main.cf
				echo "$COL_GREEN[*] $COL_RESET service installed"

			} || {
				echo "$COL_RED [!] $COL_RESET faild to install"
			}
			;;

			Install-ssl)
				#to finish 
				cat >> /etc/postfix/main.cf <<EOF
				# Enables SASL authentication for postfix
				smtp_sasl_auth_enable = yes
				# Disallow methods that allow anonymous authentication
				smtp_sasl_security_options = noanonymous
				# Location of sasl_passwd we saved
				smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd
				# Enable STARTTLS encryption for SMTP
				smtp_tls_security_level = encrypt
				# Location of CA certificates for TLS
				smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
EOF
				
				/etc/init.d/courier-imap restart
				/etc/init.d/courier-authdaemon restart
				/etc/init.d/postfix restart

				tail -11 /etc/postfix/main.cf
				echo "$COL_GREEN[*] $COL_RESET Service installed"

			;;


			Uninstall)

				apt-get  purge autoremove postfix -y

				apt-get -y purge autoremove mailutils
				apt-get -y purge autoremove courier-imap
				echo "$COL_YELLOW[!] $COL_RESET  Service Uninstalled"
				

			QUIT)
				echo "$COL_GREEN[*] $COL_RESET BYE"
				sleep 1.5
				break
			;;


			*)
				echo "Invalid Option $REPLY"
				;;



		esac
done

