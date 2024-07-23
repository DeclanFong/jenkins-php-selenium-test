#!/usr/bin/env sh

set -x

# Stop and remove any existing container with the same name
if [ "$(docker ps -q -f name=my-apache-php-app)" ]; then
    docker stop my-apache-php-app
    docker rm -f my-apache-php-app
fi

# Run the new container
docker run -d -p 80:80 --name my-apache-php-app -v C:\\ssd\\labs\\jenkins-php-selenium-test\\src:var/www/html php:7.2-apache

# Ensure the correct permissions are set inside the container
docker exec my-apache-php-app /bin/sh -c "chown -R www-data:www-data /var/www/html && find /var/www/html -type d -exec chmod 755 {} \; && find /var/www/html -type f -exec chmod 644 {} \;"

# Wait for the container to be fully ready
echo "Waiting for the container to be ready..."
# Add a timeout to avoid an infinite loop in case of issues
TIMEOUT=60
ELAPSED=0
while ! curl -s http://localhost > /dev/null; do
    if [ $ELAPSED -ge $TIMEOUT ]; then
        echo "Timeout: The container did not become ready within $TIMEOUT seconds."
        exit 1
    fi
    sleep 1
    ELAPSED=$((ELAPSED + 1))
done

set +x

echo 'Now...'
echo 'Visit http://localhost to see your PHP application in action.'
