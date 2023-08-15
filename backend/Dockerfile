ARG PHP_VERSION=8.2.8

FROM composer:2.4 AS composer

FROM php:${PHP_VERSION}-apache AS prod

RUN apt-get update && apt-get install zip unzip && apt-get clean

COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

ENV APP_ENV="prod"
ENV COMPOSER_AUTH=""

ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

RUN groupadd -g ${PGID} symfony && \
    useradd -l -u ${PUID} -g symfony -m symfony && \
    usermod -p "*" symfony -s /bin/bash

USER symfony

COPY --from=composer --chown=symfony:symfony /usr/bin/composer /usr/bin/composer

COPY --chown=symfony:symfony app/composer.json app/composer.lock /var/www/html/

# To disable looking for .env files in prod
RUN composer config extra.runtime.disable_dotenv true

COPY --chown=symfony:symfony docker/entrypoint.sh /usr/bin/entrypoint
COPY --chown=symfony:symfony app/ /var/www/html/

RUN chmod +x /usr/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["apache2-foreground"]

EXPOSE 80

FROM prod AS dev

ENV APP_ENV="dev"

RUN composer config extra.runtime.disable_dotenv false
