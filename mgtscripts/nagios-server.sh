yum install -y httpd php wget
yum -y install gcc glibc glibc-common
yum -y install gd gd-devel
yum groupinstall 'Development Tools'

useradd nagios
 
echo "123456" | passwd --stdin nagios

groupadd nagcmd

usermod -a -G nagcmd nagios

usermod -a -G nagcmd apache

mkdir nagios && cd $_  

wget https://sourceforge.net/projects/nagios/files/latest/download/nagios-4.4.6.tar.gz
 
tar zxvf nagios-4*

cd nagios-4.4.6

./configure --with-command-group=nagcmd

make all

./configure --with-command-group=nagcmd

echo "123456" | htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

service httpd restart

systemctl enable --now httpd
 
firewall-cmd --permanent --add-port=80/tcp
 
firewall-cmd --permanent --add-service=http

firewall-cmd --reload

systemctl enable --now nagios

/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg

# To resolve 403 error in nagios console

touch /var/www/html/index.html
chmod 755 /var/www/html/index.html

