FROM php:5.6-apache

RUN apt-get update && apt-get install -y \
		libmcrypt-dev \
	&& docker-php-ext-install mbstring mcrypt \
	&& docker-php-ext-install pdo pdo_mysql \
	&& docker-php-ext-install pdo mysqli \
	&& docker-php-ext-install opcache

# APCu
RUN pecl install channel://pecl.php.net/apcu-4.0.6
RUN echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini

# xhprof
RUN pecl install channel://pecl.php.net/xhprof-0.9.4
RUN echo "extension=xhprof.so" > /usr/local/etc/php/conf.d/xhprof.ini

COPY ./apache2.conf /etc/apache2/apache2.conf

# Enable mod_rewrite
RUN a2enmod rewrite

WORKDIR /srv/www/code
