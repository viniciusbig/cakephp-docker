#!/usr/bin/env bash
docker-compose exec --user www-data apache /var/www/html/bin/cake $@
