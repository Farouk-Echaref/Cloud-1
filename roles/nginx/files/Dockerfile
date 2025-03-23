#Nginx Dockerfile

#rm -rf /var/lib/apt/lists/*: This command removes the package lists that 
#were downloaded during the update process to save disk space inside the container.

FROM alpine:3.16

RUN apk update

RUN apk add nginx

RUN mkdir -p /etc/ssl/private

RUN mkdir -p /etc/ssl/certs

RUN mkdir -p /var/www/html

RUN chmod 777 /var/www/html

RUN chmod 777 /etc/ssl/private

RUN chmod 777 /etc/ssl/certs

RUN apk add openssl

EXPOSE 443

COPY ./nginxScript.sh .

RUN chmod 777 ./nginxScript.sh

COPY ./default.conf /etc/nginx/http.d/

CMD ["./nginxScript.sh"]
