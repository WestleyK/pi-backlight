#!/usr/bin/perl

#use strict;
#use warnings;


$FILE_BRIGHT = "/tmp/backlight_brightness.txt";


$OPTION = "$ARGV[0]\n";
#my $OPTION = <STDIN>;


#print $OPTION;
if ($OPTION ne "\n") {
	
	if ($OPTION eq "-a\n") {
		$OPT_A = "true";
		print "option -a\n";
	} elsif ($OPTION eq "-s\n") {
		$OPT_S = "true";
		print "option -s\n";
	} elsif ($OPTION =~ m{ [0-9]* }xms) {
		$ADJ = "true";
		$BRIGHT = $OPTION;
	} else {
		print "Option not found!\n";
		print "Try: <command> -help\n";
		exit;
	}


}


if ($OPT_A eq "true") {
	print "a true\n";
}

if ($OPT_S eq "true") {
	print "s true\n";
}

if ($ADJ eq "true") {
	if (($BRIGHT >= 15) && ($BRIGHT <= 255)) {
		#print "you brightness:";
		#print $BRIGHT;
		#print "\n";
		open($LIGHT_FILE, '>', $FILE_BRIGHT);
		print $LIGHT_FILE $BRIGHT;
		close $LIGHT_FILE;
		system("sudo bash -c 'cat /tmp/backlight_brightness.txt > /sys/class/backlight/rpi_backlight/brightness'");
		#system("sudo bash -c 'echo $BRIGHT > foo'");
	} else {
		print "Not a valid number\n";
	}
}





#print "What is your age? ";
#my $age = <STDIN>;
#if ($age >= 18) {
#	print "greaster thasn 18\n";
#}




#$OPTION = "-s";

#switch ($OPTION) {
#	case "-a" {
#		print "option -a\n";
#	}
#	case "-s" {
#		print "option -s\n";
#	}
#	case "-q" {
#		print "option -q\n";
#	}
#	else {
#		print "option not found\n";
#	}
#}


