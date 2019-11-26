FROM alpine:latest
LABEL maintainer="Stu <stu@stewart.id>"

ENV TIMEZONE=Asia/Jakarta

RUN apk update && \
    apk add --no-cache \
    gcc \
    make \
    curl \
    musl-dev \
    bash \
    php7 \
    php7-dev \
    php7-fpm \
    php7-curl \
    php7-mcrypt \
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
    php7-pdo_mysql \
    php7-common \
    php7-json \
    php7-intl \
    php7-tokenizer \
    php7-xml \
    php7-fileinfo \
    php7-pear && \
    pecl install mongodb && \
    rm -rf /var/cache/apk/* && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm

COPY php-fpm.conf /etc/php7/php-fpm.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

EXPOSE 9000

COPY conf.d/* /usr/local/etc/php/conf.d/
CMD ["php-fpm", "-F"]

