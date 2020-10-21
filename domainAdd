#!/bin/bash

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

select opt in  Domain-GITHUB-PBIS Domain-Repo-PBIS Uniinstall QUIT; do

echo "$COL_YELLOW First try option 1) Domain-GITHUB-PBIS "
		case $opt in

			Domain-GITHUB-PBIS)


				echo "$COL_CYAN [*] $COL_RESET  TYPE THE DOMAIN NAME "
				read domain;
				echo "$COL_CYAN [*]  $COL_RESET  THE DOMAIN USER TO ADD"
				read user;

				mkdir wgets
				cd wgets
				wget https://github.com/BeyondTrust/pbis-open/releases/download/9.1.0/pbis-open-9.1.0.551.linux.x86_64.deb.sh

				chmod +x pbis-open-9.1.0.551.linux.x86_64.deb.sh

				./pbis-open-9.1.0.551.linux.x86_64.deb.sh
				clear
				domainjoin-cli join $domain $user

				

				domainjoin-cli query
				echo -e "$COL_GREEN [+] $COL_RESET SERVICE INSTALLED $COL_RESET"

			;;
			Domain-Repo-PBIS)
			
				echo -e "$COL_CYAN [*]  $COL_RESET TYPE THE DOMAIN NAME "
				read domain;
				echo -e "$COL_CYAN [*] $COL_RESET  THE DOMAIN USER TO ADD"
				read user;

				mkdir wgets
				cd wgets

				wget -O - http://repo.pbis.beyondtrust.com/apt/RPM-GPG-KEY-pbis | sudo apt-key add - 
				wget -O /etc/apt/sources.list.d/pbiso.list http://repo.pbis.beyondtrust.com/apt/pbiso.list

				apt update
				apt-get -y install pbis-open
				apt-get -y install ssh
				apt-get -y install lightdm
				clear
				
				domainjoin-cli join $domain $user
				
				sudo /opt/pbis/bin/config UserDomainPrefix $dominio
				sudo /opt/pbis/bin/config AssumeDefaultDomain True
				sudo /opt/pbis/bin/config LoginShellTemplate /bin/bash
				sudo /opt/pbis/bin/config HomeDirTemplate %H/%D/%U

			

				domainjoin-cli query
				echo -e "$COL_GREEN [+]  $COL_RESET SERVICE INSTALLED  $COL_RESET"
			;;


			Uninstall)
				echo -e "$CLO_RED [-] UNINSTALLING"
				
				apt-get -y autoremove purge pbis-open
				apt-get -y autoremove purge ssh
				apt-get -y autoremove purge lightdm
				clear

				echo -e "$COL_YELLOW [*]  $COL_GREEN  UNINSTALLED $COL_RESET"

			;;
			QUIT)
				echo "closing"
				sleep 1.5
				break
			;;



			*)
				echo "Invalid Option $REPLY"
				;;

		esac
done


