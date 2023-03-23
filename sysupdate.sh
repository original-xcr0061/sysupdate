#!/bin/bash

########## Pop-OS System Update #########
#     APT - Flatpak - Pop Recovery      #
#########################################
#               by XCR0061

set -o errexit
#set -o xtrace

clear
tput setaf 208
echo "  ##################################### "
echo "  #   ____  ______________________    # "
echo "  #   \   \/  /\_   ___ \______   \   # "
echo "  #    \     / /    \  \/|       _/   # "
echo "  #    /     \ \     \___|    |   \   # "
echo "  #   /___/\  \ \______  /____|_  /   # "
echo "  #         \_/        \/       \/    # "
echo "  ##################################### "
echo "              System Update             "
echo ""
tput sgr0

# Heading - Sudo Password
	echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nAPT Update$(tput rmul) $(tput setaf 5) $(tput bold)\nPlease Enter Password... $(tput sgr0)"
	echo
	# APT system update
		sudo apt update
		echo
		apt list --upgradable
		echo
		sudo apt dist-upgrade
		echo
		sudo apt autoremove
		echo

	echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"

# Heading - Flatpak
	echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nFlatpak Update$(tput rmul) $(tput setaf 5) $(tput bold)\nPlease Wait... $(tput sgr0)"
	sleep 2
	echo
	# Flatpak system update
		flatpak list --app --columns=name,application,runtime
		echo
		flatpak update
		echo
		sleep 2
		flatpak uninstall --unused
		echo

	echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"

# Heading - Pop-OS Recovery update
	echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nPop-OS Recovery Update$(tput rmul) $(tput setaf 5) $(tput bold)\nPlease Wait... $(tput sgr0)"
	sleep 2
	echo
	# Pop-OS Recovery update
		pop-upgrade recovery upgrade from-release

	echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"
	echo
