#!/bin/sh
# Fix moodledata ownership on every container start (volume mounts as root by default)
mkdir -p /var/www/moodledata
chown -R www-data:www-data /var/www/moodledata 2>/dev/null || true
chmod -R 755 /var/www/moodledata 2>/dev/null || true
exec php-fpm
