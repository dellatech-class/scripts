#!/bin/bash

#########THIS SCRIPT CAN HELP DETERMINE YOUR AGE #########

read -p "What is your name please?: " name

read -p "What company do you work for?: " company

read -p "What year were you born ?: " year

read -p "Please provide your birth month Example 06: " month

curyear=`date +%Y`
curmonth=`date +%m`

###############################################################
## If you precede a number by 0, bash treats the number as   ##
## octal. As octal is base 8 with digits ranging from 0 to 7,## 
## 08 is out of range for octal. To solve this Explicitly    ##
## mention base as decimal by 10                             ##
###############################################################

ageinyrs=$(($curyear - $year))
ageinmnt=$((10#$curmonth - 10#$month))


if [ $ageinmnt -lt 0 ]; then
	ageinmnt=$((10#$curmonth - 10#$month+ 12))
	ageinyrs=$((ageinyrs - 1))
else
	#ageinmnt=$((10#$curmonth - 10#$month))
	ageinmnt=$ageinmnt
fi

echo "Hello mr/mrs $name who warks at $company you are $ageinyrs years and $ageinmnt months old"
