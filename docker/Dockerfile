FROM php:8.0-fpm
#USER root

# Create user
RUN groupadd -g 1000 ubuntu \
    && useradd -rm -d /home/ubuntu -g 1000 -G ubuntu -u 1000 ubuntu

# Install basic software
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget && \
    apt-get install -y git && \
    apt-get -y install software-properties-common

RUN docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN composer global require "laravel/lumen-installer"

RUN chown -R ubuntu:ubuntu /var/www
WORKDIR /var/www/html

USER ubuntu:ubuntu
