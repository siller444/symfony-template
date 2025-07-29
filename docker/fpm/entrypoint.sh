#!/bin/bash

/usr/local/bin/composer install -n --prefer-dist -o -d /code

php-fpm
