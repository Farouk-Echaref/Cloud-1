# MariaDB Dockerfile

FROM debian:buster

ARG DB_NAME
ARG DB_USER
ARG DB_ROOT_PASS
ARG DB_USER_PASS
ARG DB_HOST

RUN apt-get update
RUN apt-get install -y mariadb-server


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/create_db.sh .

RUN chmod +x create_db.sh
RUN ./create_db.sh

EXPOSE 3306

CMD ["mysqld"]