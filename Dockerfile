FROM php:7.2-apache

ENV DEBIAN_FRONTEND noninteractive
ENV VERSION=6.0

RUN apt-get update && apt-get install unzip -y && apt-get clean all && \
curl -o /icecoder.zip 'https://icecoder.net/download-zip?version=6.0' && \
unzip -q /icecoder.zip -d /tmp/ && \
cp -r /tmp/ICE* /var/www/html/ICEcoder && \
chown -R www-data.www-data /var/www/html/ICEcoder && \
rm -rf /icecoder.zip /tmp/ICE*
