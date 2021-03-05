FROM php:7.4-alpine

ENV DEBIAN_FRONTEND noninteractive
ENV PS1 '\[\033[36m\]\u\[\033[m\]@\[\033[32m\]${APP_NAME}:\[\033[33;1m\]\w\[\033[m\]\$'
ENV APP_NAME ${APP_NAME:-'no-name-set'}
ENV APP_ENV prod
ENV APP_DEBUG no
ENV APP_XDEBUG no
ENV COLUMNS 1000

RUN apk add --no-cache autoconf openssl-dev g++ make pcre-dev icu-dev zlib-dev libzip-dev yaml-dev postgresql-dev libxml2-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install -j$(nproc) pcntl pdo_mysql pdo_pgsql zip xml bcmath intl opcache zip sockets \
    && pecl install xdebug-2.9.5 \
    && apk del --purge autoconf g++ make

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

##### add configuration
COPY devops/build/php/config /usr/local/etc/php/conf.d
###### startup scripts
RUN mkdir -p /etc/my_init.d/scripts

#### Hooks
RUN mkdir -p /usr/bin/hooks
COPY devops/build/php/bin/hooks /usr/bin/hooks
RUN chmod +x -R /usr/bin/hooks

#### Copy utils
COPY devops/build/php/utils/wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it

COPY devops/build/php/utils/debug /usr/local/bin/debug
RUN chmod +x /usr/local/bin/debug

##### set work dir
WORKDIR /var/www/project

###### entrypoint
COPY devops/build/php/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

###### entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

