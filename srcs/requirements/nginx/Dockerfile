FROM debian:11

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y\
    nginx\
    openssl

RUN  mkdir  /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/L=Khouribga/O=42/OU=1337/CN=ysahih.42.fr/UID=ysahih"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443 

CMD [ "nginx" ,  "-g" ,  "daemon off;" ]