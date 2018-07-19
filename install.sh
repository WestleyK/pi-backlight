#!/bin/sh
#
# Created by: Westley K
# email: westley@sylabs.io
# Date: Jul 18, 2018
# version-1.0-beta-1


OPTION=$1
SCRIPT_NAME="pi-backlight"
PATH_INSTALL="/usr/local/bin/"


IS_ROOT=$( id -u )

if [ $IS_ROOT != 0 ]; then
	echo "Please run as root!"
	echo "try: sudo ./install.sh"
	exit
fi


if [ -z $OPTION ]; then
	if [ -e $PATH_INSTALL$SCRIPT_NAME ]; then
		echo $SCRIPT_NAME "is already installed to" $PATH_INSTALL
		echo "Continuing will overide the existing script"
		echo "Do you want to continue?"
		echo -n "[y,n]:"
		read INPUT
		if [ $INPUT = "y" ] || [ $INPUT = "Y" ]; then
			echo "Installing" $SCRIPT_NAME\ "..."
			chmod +x pi-backlight
			cp $SCRIPT_NAME $PATH_INSTALL
			echo "Installed to" $PATH_INSTALL
			exit
		fi
	fi

	echo "Installing" $SCRIPT_NAME\ "..."
	chmod +x $SCRIPT_NAME
	cp $SCRIPT_NAME $PATH_INSTALL
	echo "Installed to" $PATH_INSTALL
	exit

fi

if [ "$OPTION" = "-u" ] || [ "$OPTION" = "-update" ]; then
	echo "This will update the existing script if theres one present"
	echo "Are you sure you want to continue?"
	echo -n "[y,n]:"
	read INPUT
	if [ $INPUT = "y" ] || [ $INPUT = "Y" ]; then
		echo "Updating..."
		git pull origin master
		echo "Installing" $SCRIPT_NAME\ "..."
		chmod +x $SCRIPT_NAME
		cp $SCRIPT_NAME $PATH_INSTALL
		echo "Installed to" $PATH_INSTALL
		exit
	else
		echo "Aborting."
		exit
	fi
elif [ "$OPTION" = "-r" ] || [ "$OPTION" = "-uninstall" ]; then
		if [ -e $PATH_INSTALL$SCRIPT_NAME ]; then
			echo "This will uninstall" $SCRIPT_NAME "from" $PATH_INSTALL
			echo "Are you sure you want to continue?"
			echo -n "[y,n]:"
			read INPUT
			if [ $INPUT = "y" ] || [ $INPUT = "Y" ]; then
				echo "Uninstalling" $SCRIPT_NAME "from" $PATH_INSTALL
				rm $PATH_INSTALL$SCRIPT_NAME
				echo "Done."
				exit
			else
				echo "Aborting."
				exit
			fi
		else
			echo \'$SCRIPT_NAME\' "not installed to" \'$PATH_INSTALL\'
			exit
		fi
else
	echo "Usage: sudo ./install [OPTION]
		-u | -update (update command and repo)
		-r | -uninstall (uninstall command)"
	exit
fi


#
# End install script
#


