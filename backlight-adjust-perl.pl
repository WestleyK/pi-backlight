#!/usr/bin/perl
#
# Created bt: Westley K
# Email: westley@sylabs.io
# Date Jul 11, 2018
# https://github.com/WestleyK/backlight-adjust
# Version-1.0-beta



#use strict;
#use warnings;


$VERSION_SCRIPT = "version-1.0-beta\n";

$FILE_BRIGHT = "/tmp/backlight_brightness.txt";
$FILE_DISP_ON = "/tmp/backlight_power.txt";

$OPTION = "$ARGV[0]\n";


if ($OPTION ne "\n") {
	
	if ($OPTION eq "-h\n" || $OPTION eq "-help\n" || $OPTION eq "--help\n") {
		$OPT_H = "true";
	} elsif ($OPTION eq "-s\n" || $OPTION eq "-sleep\n") {
		$OPT_S = "true"
	} elsif ($OPTION eq "-d\n") {
		$OPT_D = "true";
	} elsif ($OPTION eq "-v\n" || $OPTION eq "-version\n" || $OPTION eq "--version\n") {
		$OPT_V = "true";
	} elsif ($OPTION =~ /[0-9]/) {
		$ADJ = "true";
		$BRIGHT = $OPTION;
	} else {
		print "Option not found!\n";
		print "Try: <command> -help\n";
		exit;
	}


}


if ($OPT_H eq "true") {
	print "Usage: <command> [option]
	-h | -help | --help (print help menu)
	15-255 (adjust from 15 to 255)
	-s | -sleep (enter sleep mode)
	-d (print currnt brightness, scale:[15-255])
	-v | -version | --version (print version)\n";
	exit;
}

if ($OPT_S eq "true") {
	print "Press enter to exit this mode.\n";
	sleep(2);
	system("sudo bash -c 'echo 1 > /sys/class/backlight/rpi_backlight/bl_power'");
	$STOP = <STDIN>;
	system("sudo bash -c 'echo 0 > /sys/class/backlight/rpi_backlight/bl_power'");
	exit;
}

if ($OPT_D eq "true") {
	print "Scale:[15-255]:\n";
	system("cat /sys/class/backlight/rpi_backlight/brightness");
	exit;
}

if ($OPT_V eq "true") {
	print $VERSION_SCRIPT;
	exit;
}

if ($ADJ eq "true") {
	if (($BRIGHT >= 15) && ($BRIGHT <= 255)) {
		open($LIGHT_FILE, '>', $FILE_BRIGHT);
		print $LIGHT_FILE $BRIGHT;
		close $LIGHT_FILE;
		system("sudo bash -c 'cat /tmp/backlight_brightness.txt > /sys/class/backlight/rpi_backlight/brightness'");
		exit;
	} else {
		print "Not a valid number\n";
		exit;
	}
}

print "[15-255]:";
$BRIGHT = <STDIN>;
if (($BRIGHT >= 15) && ($BRIGHT <= 255)) {
	open($LIGHT_FILE, '>', $FILE_BRIGHT);
	print $LIGHT_FILE $BRIGHT;
	close $LIGHT_FILE;
	system("sudo bash -c 'cat /tmp/backlight_brightness.txt > /sys/class/backlight/rpi_backlight/brightness'");
} else {
	print "Not a valid number!\n";
	exit;
}




#
# End Perl Script;
#



