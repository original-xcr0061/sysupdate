#!/bin/bash

##############################################
#       APT - Flatpak - pop-OS Recovery      #
#               SELECT SCRIPT                #
#                                            #
##############################################
#                  by XCR0061                #
##############################################

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
echo "  #           System Update           # "
echo "  ##################################### "
echo ""
tput sgr0

##############################################
############## Script Settings ###############

## Exit If any command returns a non-zero
set -o errexit
##  Exit if an uninitialized variable is used
set -o nounset

## Uncomment For debugging
#set -o xtrace

##############################################
# Display menu
echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"
echo -e "Please choose an option:"
echo
echo -e "1. Update everything (Excluding recovery)"
echo -e "2. Update APT only"
echo -e "3. Update Flatpak & Snaps only"
echo -e "4. Update recovery"
echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"

# Read the user choice
read option

##############################################
# APT update function
apt_update() {
    echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nAPT Update$(tput rmul) $(tput setaf 5) $(tput bold)\nPlease Enter Password... $(tput sgr0)"
    sudo apt update
    echo
    apt list --upgradable
    echo
    sleep 1
    sudo apt dist-upgrade
#    echo
#    echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nAPT Auto Uninstall $(tput rmul) $(tput sgr0)"
#    sleep 1
#    sudo apt autoremove
    echo
}

# Flatpak update function
flatpak_update() {
    echo
    sleep 1
    echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nFlatpak Update$(tput rmul) $(tput setaf 5) $(tput bold)\nPlease Wait... $(tput sgr0)"
    echo
    flatpak list --app --columns=name,application,runtime
    echo
    sleep 1
    flatpak update
    echo
    echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nFlatpak Uninstall Unused Apps & Runtime $(tput rmul) $(tput sgr0)"
    sleep 1
    flatpak uninstall --unused
    echo
}

# Pop-OS Recovery update function
popos_recovery_update() {
    sleep 1
    echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nPop-OS Recovery Update$(tput rmul) $(tput setaf 5) $(tput bold)\nPlease Wait... $(tput sgr0)"
    echo
    pop-upgrade recovery upgrade from-release
    echo
}

# Snap Package update.
snap_update() {
	echo
    	sleep 1
    	echo -e "$(tput setaf 6) $(tput bold) $(tput smul)\nSnap Update$(tput rmul) $(tput setaf 5) $(tput bold)\nPlease Wait... $(tput sgr0)"
	echo
	snap list
	echo
	sleep 1
	sudo snap refresh
	echo
}

##############################################
# Execute based on the chosen option
case $option in
    1)
        apt_update
        echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"
        flatpak_update
        echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"
        snap_update
        ;;
    2)
        apt_update
        ;;
    3)
        flatpak_update
        echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"
        snap_update       ;;
    4)
        popos_recovery_update
        ;;
    *)
        echo -e "Invalid option"
        ;;
esac
echo -e "$(tput setaf 6) $(tput bold)\nAll Done!! $(tput sgr0)"
echo -e "$(tput setaf 6)\n================================================== $(tput sgr0)"
