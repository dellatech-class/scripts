#/bin/bash
## This script configures any rhel based system to be monitored by Nagios

## Install needed packages
 yum install -y gcc glibc glibc-common openssl openssl-devel perl wget
 
 mkdir /tmp/nagios && cd $_
 
 wget --no-check-certificate -O nrpe.tar.gz https://github.com/NagiosEnterprises/nrpe/archive/nrpe-3.2.1.tar.gz

 tar xzf nrpe.tar.gz
 
 cd nrpe-nrpe-3.2.1/
 
 ./configure --enable-command-args
 
 make all
 
 make install-groups-users
 
 make install
 
 make install-config
   
 echo >> /etc/services
 
 echo '# Nagios services' >> /etc/services
 
 echo 'nrpe    5666/tcp' >> /etc/services
 
 make install-init

 systemctl enable nrpe.service

 sed -i 's/allowed_hosts=127.0.0.1,::1/allowed_hosts=127.0.0.1,192.168.1.190/g' /usr/local/nagios/etc/nrpe.cfg

 systemctl start nrpe.service
   
 firewall-cmd --permanent --add-port=5666/tcp
 
 firewall-cmd --reload
 
 systemctl restart nrpe

 /usr/local/nagios/libexec/check_nrpe -H 127.0.0.1
