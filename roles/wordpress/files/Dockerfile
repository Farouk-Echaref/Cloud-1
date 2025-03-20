#Wordpress Dockerfile

FROM debian:buster

ARG WP_USER \
    WP_PASS \
    WP_EMAIL \
    WP_TITLE \
    DB_HOST \
    DB_NAME \
    DB_USER \
    DB_USER_PASS \
    USR \
    USER_EMAIL \
    USER_PASSWORD 

RUN mkdir -p /run/php/

RUN apt-get update 

RUN apt-get install php php7.3-fpm php-mysql curl -y

COPY ./tools/wp_script.sh .

RUN chmod 777 ./wp_script.sh

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./conf/php.ini /etc/php/7.3/fpm

EXPOSE 9000

ENTRYPOINT [ "./wp_script.sh" ]

CMD [ "php-fpm7.3", "-F" ]