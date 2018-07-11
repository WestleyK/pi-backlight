#!/bin/bash
#
# Created by: Westley K
# Date: Jul 5, 2018
# version-1.2
# https://github.com/WestleyK/backlight-adjuster
#
# this install script must be runed as root or sudo
# sudo ./install.sh


INSTALL_PATH="/usr/local/bin"


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
			echo "usage ./install [option]
		-h | -help | --help (display help menu)
		-c (check if on latest version) (comming soon)
		-u (un-install command)"
			exit
			;;
		-c)
			echo "comming soon!"
			exit
			;;
		-u)
			un_install=$"true"
			echo "un-installing"
			;;
		*)
			echo "option not found :o try: ./install.sh -help"
			;;
	esac
fi


echo "backlight-adjust installer"
echo "https://github.com/WestleyK/backlight-adjust"
echo "./install.sh -help (for help)"
echo


# check if we need to un-install
if [[ $un_install == "true" ]]; then
	check_script=$( ls $INSTALL_PATH | grep backlight-adjust )
	if [[ -z $check_script ]]; then
		echo "nothing to un-install"
		exit
	fi
	echo "are you sure you want to un-install backlight-adjust"
	echo -n "[y,n]:"
	read input
	echo
	if [[ $input == "y" || $input == "Y" ]]; then
		echo "un-installing..."
		sudo rm $INSTALL_PATH/backlight-adjust
		echo "un-installed"
		exit
	fi
fi


# check if its installed aready
check_script=$( ls $INSTALL_PATH | grep backlight-adjust )
if [[ -n $check_script ]]; then 
	echo "it seems like its already installed"
	exit
fi

# check if the script is still here
check_script=$( ls | grep ^backlight-adjust$ )
if [[ -z $check_script ]]; then 
	echo "No script to install."
	exit
fi
echo "Installing..."

# the install part
sudo chmod +x backlight-adjust
sudo cp backlight-adjust $INSTALL_PATH

echo "Installed!"
echo
echo "(backlight-adjust) is installed!"
echo "See: backlight-adjust -help (for help)"


#
# End install script
#

