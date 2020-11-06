#!/bin/bash

if [ -f $1 ]; then

   echo "$1 exist here is its content"
   cat $1

else
  echo "$1 does not exist. "

fi

