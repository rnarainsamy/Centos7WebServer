yum install httpd mod_ssl -y
systemctl enable --now httpd
firewall-cmd --permanent --add-service=http{,s}
firewall-cmd --reload
yum install mariadb-server -y
systemctl enable --now mariadb
mysql_secure_installation
