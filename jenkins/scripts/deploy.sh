#!/usr/bin/env sh

set -x

# Stop and remove any existing container with the same name
if [ "$(docker ps -q -f name=my-apache-php-app)" ]; then
    docker stop my-apache-php-app
    docker rm -f my-apache-php-app
fi

# Run the new container
docker run -d -p 80:80 --name my-apache-php-app -v c:\\Users\\decla\\OneDrive\\Desktop\\SIT\\Year 2\\Y2T3\\Secure Software Development\\Labs\\Week 8\\jenkins-php-selenium-test\\src:/var/www/html php:7.2-apache

sleep 1

set +x

echo 'Now...'
echo 'Visit http://192.168.68.67 to see your PHP application in action.'
