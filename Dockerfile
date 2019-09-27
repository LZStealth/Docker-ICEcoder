FROM php:7.2-apache

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get clean all \
    && curl -o /icecoder.zip "https://icecoder.net/download-zip?version=7.0"  \
    && unzip -q "/icecoder.zip" -d /tmp/ \
    && cp -r /tmp/ICE* /var/www/html/ICEcoder \
    && chown -R www-data.www-data /var/www/html/ICEcoder \
    && rm -rf /icecoder.zip /tmp/ICE* \
    cd /var/www/html \
    chmod 757 {backups,lib,plugins,test,tmp}
