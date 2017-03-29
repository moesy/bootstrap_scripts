#!/bin/bash
yum update -y
yum install java-1.8.0 -y
yum install java-1.8.0-openjdk-devel -y
#sudo /usr/sbin/alternatives --config java
# sudo /usr/sbin/alternatives --config javac
yum remove java-1.7.0-openjdk -y
echo "Installing logstash"
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
echo "[logstash-5.x]
name=Elastic repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
autorefresh=1
type=rpm-md" > /etc/yum.repos.d/logstash.repo
yum install logstash -y
# load config files
# sudo -u logstash /usr/share/logstash/bin/logstash --path.settings /etc/logstash -t
# bin/logstash -f /etc/logstash/conf.d/elb-s3-logs.conf --config.test_and_exit
initctl start logstash
# don't forget to give .conf files proper perms
# still not running as a daemon
