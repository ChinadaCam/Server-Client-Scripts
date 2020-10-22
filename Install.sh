#!/bin/bash

ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

repo= "https://github.com/HackTheBit/Server-Client-Scripts"


check_repo(){





}



select opt in  Domain-GITHUB-PBIS Domain-Repo-PBIS Uniinstall QUIT; do

		case $opt in



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








