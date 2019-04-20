# Docker PHP-FPM-ALPINE with php-redis & mongodb support 

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
```