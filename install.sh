#!/bin/bash
#
# Created by: Westley K
# Date: Jul 11, 2018
# version-2.0
# https://github.com/WestleyK/pi-backlight
#
# this install script must be runed as root or sudo
# sudo ./install.sh


INSTALL_PATH="/usr/local/bin"
SCRIPT_NAME="pi-backlight"


# check if your root
if [[ "$EUID" -ne 0 ]]; then 
	echo "Please run as root"
	echo "sudo ./install.sh"
	exit
fi

option=$1
if [[ -n $option ]]; then
	case $option in
		-h | -help | --help)
			echo "Usage: sudo ./install [option]
		-h | -help | --help (display help menu)
		-c (check if on latest version) (comming soon)
		-u (un-install command)"
			exit
			;;
		-c)
			echo "Comming soon!"
			exit
			;;
		-u)
			un_install=$"true"
			echo "Un-installing"
			;;
		*)
			echo "Option not found :o try: ./install.sh -help"
			;;
	esac
fi


echo "pi-backlight installer"
echo "https://github.com/WestleyK/pi-backlight"
echo "./install.sh -help (for help)"
echo


# check if we need to un-install
if [[ $un_install == "true" ]]; then
	check_script=$( ls $INSTALL_PATH | grep backlight-adjust )
	if [[ -z $check_script ]]; then
		echo "Nothing to un-install"
		exit
	fi
	echo "Are you sure you want to un-install $SCRIPT_NAME"
	echo -n "[y,n]:"
	read input
	echo
	if [[ $input == "y" || $input == "Y" ]]; then
		echo "Un-installing..."
		sudo rm $INSTALL_PATH/$SCRIPT_NAME
		echo "Un-installed"
		exit
	fi
fi


# check if its installed aready
check_script=$( ls $INSTALL_PATH | grep $SCRIPT_NAME )
if [[ -n $check_script ]]; then 
	echo "It seems like its already installed"
	exit
fi

# check if the script is still here
check_script=$( ls | grep ^$SCRIPT_NAME$ )
if [[ -z $check_script ]]; then 
	echo "No script to install."
	exit
fi
echo "Installing..."

# the install part
sudo chmod +x $SCRIPT_NAME
sudo cp $SCRIPT_NAME $INSTALL_PATH

echo "Installed!"
echo
echo "($SCRIPT_NAME) is installed!"
echo "See: $SCRIPT_NAME -help (for help)"


#
# End Install Script
#

