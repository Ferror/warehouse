
FROM composer:2.4 AS composer

FROM php:8.2-apache AS prod

COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

ENV APP_ENV="prod"
ENV COMPOSER_AUTH=""

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY app/composer.json app/composer.lock /var/www/html/

# To disable looking for .env files in prod
RUN composer config extra.runtime.disable_dotenv true

COPY docker/entrypoint.sh /usr/bin/entrypoint
COPY app/ /var/www/html/

RUN chmod +x /usr/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["apache2-foreground"]

EXPOSE 80

FROM prod AS dev

ENV APP_ENV="dev"

RUN composer config extra.runtime.disable_dotenv false
