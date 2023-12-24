FROM debian:11

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y\
    nginx\
    wget

RUN  mkdir  /etc/nginx/ssl


RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/L=Khouribga/O=42/OU=1337/CN=localhost/UID=ysahih"

# RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -O /usr/bin/mkcert && \
#     chmod +x /usr/bin/mkcert && \
#     mkcert -install && \
#     mkcert -cert-file /etc/nginx/ssl/inception.crt -key-file /etc/nginx/ssl/inception.key 

# RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/html

# COPY  ./file.html /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443 

CMD [ "nginx" ,  "-g" ,  "daemon off;" ]