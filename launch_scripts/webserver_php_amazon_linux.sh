#!/bin/bash
yum update -y
yum install httpd php -y
aws s3 cp s3://blogwslnerds /var/www/html/ --recursive
service httpd start
chkconfig httpd on
echo "<?php phpinfo();?>" > /var/www/html/index.php
