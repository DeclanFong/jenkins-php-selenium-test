#!/usr/bin/env sh

# Enable script debugging
set -x

# Run the Docker container with the PHP application
docker run -d -p 80:80 --name my-apache-php-app -v /c/Users/decla/OneDrive/Desktop/SIT/Year\ 2/Y2T3/Secure\ Software\ Development/Labs/Week\ 8/jenkins-php-selenium-test/src:/var/www/html php:7.2-apache

# Sleep for a short time to allow the container to initialize
sleep 1

# Disable script debugging
set +x

# Output message to indicate the script has completed
echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'
