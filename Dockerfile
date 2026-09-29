FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libzip-dev libicu-dev zlib1g-dev libxml2-dev libxslt1-dev libsodium-dev default-mysql-client git \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd mysqli pdo_mysql zip intl soap exif opcache \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && rm -rf /var/lib/apt/lists/*

RUN echo "opcache.memory_consumption=256\n\
opcache.interned_strings_buffer=16\n\
opcache.max_accelerated_files=10000\n\
opcache.revalidate_freq=60\n\
opcache.fast_shutdown=1\n\
opcache.enable_cli=1\n" > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN echo "max_input_vars=5000\n\
memory_limit=512M\n\
post_max_size=100M\n\
upload_max_filesize=100M\n" > /usr/local/etc/php/conf.d/moodle.ini

COPY config/php-fpm.conf /usr/local/etc/php-fpm.d/zz-moodle.conf

RUN rm -rf /var/www/html/* \
    && git clone -b MOODLE_403_STABLE git://git.moodle.org/moodle.git /var/www/html --depth=1 \
    && chown -R www-data:www-data /var/www/html
