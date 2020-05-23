FROM php:7.0-fpm-alpine
LABEL maintainer="Stu <stu@stewart.id>"

ENV TIMEZONE=Asia/Jakarta

RUN apk update && \
    apk add --no-cache \
    gcc \
    make \
    curl \
    musl-dev \
    bash \
    libmcrypt \
    php7 \
    php7-dev \
    php7-fpm \
    php7-curl \
    php7-phar \
    php7-zip \
    php7-openssl \
    php7-zlib \
    php7-gd \
    php7-redis \
    php7-mbstring \
    php7-mysqli \
    php7-gd \
    php7-zlib \
    php7-mysqlnd \
    php7-pdo \
    php7-common \
    php7-json \
    php7-tokenizer \
    php7-xml \
    php7-intl \
    php7-fileinfo \
    php7-pear && \
    pecl install mongodb && \
    rm -rf /var/cache/apk/* && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm

RUN docker-php-ext-install mysqli pdo pdo_mysql mcrypt
RUN docker-php-ext-enable mysqli

COPY php-fpm.conf /usr/local/etc/php-fpm.d/php-fpm.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

EXPOSE 9000

COPY conf.d/* /usr/local/etc/php/
CMD ["php-fpm", "-F"]
