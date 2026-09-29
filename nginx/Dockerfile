FROM nginx:stable-alpine
# Bake Moodle code ke image nginx juga (tanpa volume sharing, anti-502)
RUN apk add --no-cache git \
    && rm -rf /var/www/html/* \
    && git clone -b MOODLE_403_STABLE https://github.com/moodle/moodle.git /var/www/html --depth=1 \
    && chmod -R 755 /var/www/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
