# Docker PHP-FPM-ALPINE with php socket, php-redis & mongodb support 

### PHP VERSION
```sh
$ php -v
PHP 7.3.0
```

### Build Command
```sh
$ cd php-fpm-alpine
$ docker build --rm --no-cache -t deadsquad/php-fpm-alpine:latest ./
```

### docker-compose.yml
```yaml
php:
  image: deadsquad/php-fpm-alpine
  ports:
    - 9000:9000
  volumes:
    - basedir:/var/www/html
  volumes:
    - basedir:/var/www/html
    - ./php7/php.ini:/etc/php7/php.ini
    - ./php7/www.conf:/etc/php7/php-fpm.d/www.conf
    - "phpsocket:/socket"
```
