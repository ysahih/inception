FROM debian:11

RUN apt update && apt install -y mariadb-server 

COPY ./tools/db.sh /tmp/initial_db.sh


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 


RUN chmod 755 /tmp/initial_db.sh

CMD  service mariadb start &&  sh  "/tmp/initial_db.sh" && mysqld_safe

EXPOSE 3306 