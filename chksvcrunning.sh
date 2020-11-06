#!/bin/bash
if ! rpm -qa | grep -qw chrony; then
 sudo yum -y install chronyd
fi
