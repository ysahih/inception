FROM debian:11

RUN apt update -y && apt install -y mariadb-server 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY ./tools/db.bash /tmp/initial_db.sh

CMD [ "sh", "/tmp/initial_db.sh" ]
