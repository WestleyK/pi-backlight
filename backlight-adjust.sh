#!/bin/bash
#
# Created by: Westley K
# Date: Jul 5, 2018
# Version-1.0
#

input_blk=$1
if [[ -n $input_blk ]]; then
	if [[ $input_blk = *"-"* ]]; then
		input_blk=$( echo $input_blk | cut -c2- )
	fi
	if [[ $input_blk -le "14" ]]; then
		echo "Must br greater then 15"
		echo "Or try: backlight-adjust -?"
		exit
	fi
	sudo bash -c "echo $input_blk > /sys/class/backlight/rpi_backlight/brightness"
	exit
fi

echo -n "[15-255]:"
read blk
echo

if [[ $blk -le "14" ]]; then
	echo "Must be greater than 15"
	echo "Or try: backlight-adjust -?"
	exit
fi

sudo bash -c "echo $blk > /sys/class/backlight/rpi_backlight/brightness"


