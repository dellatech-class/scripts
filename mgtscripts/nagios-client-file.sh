#!/bin/bash
## Usage = bash nagios-client-file.sh ipadress hostname
 
 ip=$1
 hostname=$2

 cd /usr/local/nagios/etc/servers

 cp instance-baseline $hostname.cfg

 sed -i "s/mayansible2.dellatechglobal.com/$hostname/g" "$hostname".cfg

 sed -i "s/192.168.1.244/$ip/g" "$hostname".cfg

 /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
 
 systemctl restart nagios

