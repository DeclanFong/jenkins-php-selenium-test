#!/usr/bin/env sh

set -x

# Update the path to use Unix-style slashes
docker run -d -p 80:80 --name my-apache-php-app -v /home/decla/OneDrive/Desktop/SIT/Year_2/Y2T3/Secure_Software_Development/Labs/Week_8/jenkins-php-selenium-test/src:/var/www/html php:7.2-apache

sleep 1

set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'
