rpm -qa *firmware | grep -v linux-firmware | xargs yum remove -y
yum install open-vm-tools yum-cron yum-utils firewalld chrony bash-completion net-tools -y
systemctl start {vmtoolsd,firewalld}
grep -q installonly_limit=5 /etc/yum.conf && sed -i.bak '/installonly_limit/s/5/2/' /etc/yum.conf
egrep -q 'apply_updates = no|random_sleep = 360' /etc/yum/yum-cron.conf && sed -ri.bak -e '/apply_updates/s/no/yes/' -e 's/^(random_sleep)\b/#\1/' /etc/yum/yum-cron.conf
yum update -y && reboot
