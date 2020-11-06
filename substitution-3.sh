#!/bin/bash
# This Script Demonstrates Command Substitution"
TODAYSDATE=`date`
USERFILES=`find /home -user $USER`
#USERFILES=`find /home -user admin`

echo "Today's Date is $TODAYSDATE"
echo "All files owned by admin: $USERFILES"

### Command Substitution

shopt -s expand_aliases
alias TODAY="date"
alias UFILES="find /home -user admin"

A=`TODAY`
B=`UFILES`

echo "With Aliase Today is: $A"
echo "With Aliase UFILES is: $B"

