#Codigo para instalar o pdo_mysql e criar assim uma imagem personalizada

#Imagem base
FROM php:8.0.3-fpm-buster

#Instala extensao php ausente em laravel
RUN docker-php-ext-install bcmath pdo_mysql
#RUN docker build -t <hub-user>/<repo-name>
#Puxa a imagem padrao do Composer disponivel na DockerHub
RUN apt-get update
RUN apt-get install -y git zip unzip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#Docker expoe a porta 9000 do container
EXPOSE 9000