FROM php:7.4-cli-alpine

RUN apk add --no-cache composer

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install --no-scripts --no-autoloader

COPY . ./

RUN composer dump-autoload --no-scripts --optimize

CMD ["symfony", "server:start", "--port=8000", "--allow-http"]
