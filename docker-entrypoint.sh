#!/bin/sh
# Fix moodledata ownership on every container start (volume mounts as root by default)
mkdir -p /var/www/moodledata
chown -R www-data:www-data /var/www/moodledata 2>/dev/null || true
chmod -R 755 /var/www/moodledata 2>/dev/null || true
# Auto-fix reverse-proxy HTTPS (Coolify/Traefik terminates SSL, Moodle sees plain HTTP).
# Enable by setting MOODLE_BEHIND_SSL_PROXY=1 in environment.
if [ "$MOODLE_BEHIND_SSL_PROXY" = "1" ] && [ -f /var/www/html/config.php ]; then
  sed -i "s|\$CFG->wwwroot *= *'http://|\$CFG->wwwroot = 'https://|" /var/www/html/config.php
  grep -q "sslproxy" /var/www/html/config.php || sed -i "/\$CFG->wwwroot/a \$CFG->sslproxy = true;" /var/www/html/config.php
fi
exec php-fpm
