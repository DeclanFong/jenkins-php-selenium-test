#!/usr/bin/env sh

set -x
docker run -d -p 80:80 --name my-apache-php-app -v c:\\Users\\decla\\OneDrive\\Desktop\\SIT\\Year 2\\Y2T3\\Secure Software Development\\Labs\Week 8\\jenkins-php-selenium-test\\src:/var/www/html php:7.2-apache
sleep 1
set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'

