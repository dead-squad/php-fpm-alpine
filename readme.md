# Docker PHP-FPM-ALPINE with php-redis & mongodb support

### Build Command
```sh
$ cd php-fpm-alpine
$ docker build --rm --no-cache -t deadsquad/php-fpm-alpine:latest ./
```

### docker-ccompose.yml
```yaml
php:
  image: deadsquad/php-fpm-alpine
  expose:
    - 9000
  volumes:
    - basedir:/var/www/html
    - ./php/php.ini:/usr/local/etc/php/php.ini
    - .php/composer:/usr/local/bin/composer
```