#!/bin/bash
MYUSERNAME="Bright"
MYPASSWD="Password123"
STARTOFSCRIPT=`date`

echo "My login name for this application is $MYUSERNAME"
echo "My login password for this application is $MYPASSWD"
echo "I started the Script at $STARTOFSCRIPT"

sleep 30

ENDOFSCRIPT=`date`

echo "The Script ended at $ENDOFSCRIPT"
