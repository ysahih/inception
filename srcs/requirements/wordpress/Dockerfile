FROM debian:11

RUN apt update && apt install -y \
    php7.4 \
    php7.4-mysql \
    php7.4-fpm \
    curl \ 
    wget 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \ 
  &&  chmod  +x wp-cli.phar \ 
&&  mv  wp-cli.phar /usr/local/bin/wp

# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/d
COPY ./tools/create_wordpress.sh /tmp/create_wordpress.sh

RUN chmod +x /tmp/create_wordpress.sh && mkdir -p /var/www/html &&\
    chown -R www-data:www-data /var/www/html && mkdir -p /run/php &&\
    chown -R www-data:www-data /run/php
              #user:group
WORKDIR /var/www/html

EXPOSE 9000

CMD ["bash", "/tmp/create_wordpress.sh"]