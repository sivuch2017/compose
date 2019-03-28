FROM alpine:latest

RUN apk add --no-cache phpldapadmin php7-fpm php7-apache2 \
    && mkdir -p /run/apache2 \
    && rm -rf /var/www/localhost/htdocs \
    && ln -sf /usr/share/webapps/phpldapadmin/htdocs/ /var/www/localhost/ \
    && sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf

COPY config.php /etc/phpldapadmin/config.php
COPY entrypoint.sh /entrypoint.sh
RUN chmod 644 /etc/phpldapadmin/config.php \
    && chmod 755 /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
