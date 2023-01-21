#!/bin/bash

if [ "$APP_ENV" == "prod" ];
then
    composer install --no-interaction --no-dev --optimize-autoloader
else
    composer install --no-interaction
fi

bin/console cache:warmup

exec "$@"