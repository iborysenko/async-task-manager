FROM php:8.0.3-cli-buster

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]${APP_NAME}:\[\033[33;1m\]\w\[\033[m\]\$ "' >> ~/.bashrc
ENV APP_NAME ${APP_NAME:-'no-name-set'}
ENV APP_ENV prod
ENV APP_DEBUG no
ENV APP_XDEBUG no
ENV COLUMNS 1000

RUN apt-get update \
    && apt-get install -y --no-install-recommends procps libpq-dev libpng-dev zlib1g-dev libxml2-dev libgmp-dev libzip-dev libssl-dev librabbitmq-dev libssh-dev libyaml-dev libz-dev libicu-dev wget g++\
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install -j$(nproc) pcntl pdo_mysql pdo_pgsql zip xml bcmath intl opcache zip sockets \
    && pecl install xdebug apcu amqp-1.11.0beta yaml pcov \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/ \
    && docker-php-ext-configure gmp \
    && docker-php-ext-install gmp \
    && docker-php-ext-enable amqp yaml \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=spiralscout/roadrunner:1.8.4 /usr/bin/rr /usr/bin/rr

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

