FROM php:7.2-apache

MAINTAINER ivandreyv@gmail.com

RUN apt-get update && apt-get -y upgrade && apt-get -y install apt-utils && export DEBIAN_FRONTEND=noninteractive && \
 apt-get install -y tzdata && apt-get -y install unzip mycli curl git mariadb-client zlib1g-dev && a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
