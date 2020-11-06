#!/bin/bash
if  rpm -qa | grep -qw chrony;
then

  echo "chrony service is running"

else

  sudo yum -y install chronyd

fi
