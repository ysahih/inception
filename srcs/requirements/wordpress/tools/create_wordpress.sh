sleep 5


if [ -f var/www/html/wp-config.php]
then
    echo "kayn"
else
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

    wp core download --path=/var/www/html/ --allow-root

    cp /var/www/html/wp-config-sample.php  /var/www/html/wp-config.php

    wp config set DB_NAME $DATABASE --path=/var/www/html/ --allow-root
    wp config set DB_USER $DATABASE_USER --path=/var/www/html/ --allow-root
    wp config set DB_PASSWORD $DATABASE_PASSWORD --path=/var/www/html/ --allow-root
    wp config set DB_HOST $HOSTNAME --path=/var/www/html/ --allow-root

    wp core install --url=$DOMAIN_NAME --title="$TITLE" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root
    wp user create --path=/var/www/html/ $USER_NAME $USER_EMAIL --user_pass=$USER_PASS --allow-root
fi
php-fpm7.4 -F