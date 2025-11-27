ENV?=development
ARGUMENT?=

USE_PROD_ENV_FILES = --env-file ./docker/environments/.env \
				--env-file ./docker/environments/mysql.env \
				--env-file ./docker/environments/redis.env \
				--env-file ./docker/environments/nginx.env \
				--env-file ./docker/environments/php.env \
				--env-file ./docker/environments/nodejs.env \
				--env-file ./docker/environments/reactjs.env

USE_LOCAL_ENV_FILES = --env-file ./docker/environments/.env \
					  --env-file ./docker/environments/local.env \
					  --env-file ./docker/environments/mysql.env \
					  --env-file ./docker/environments/redis.env \
					  --env-file ./docker/environments/nginx.env \
					  --env-file ./docker/environments/php.env \
					  --env-file ./docker/environments/nodejs.env \
					  --env-file ./docker/environments/reactjs.env

PHP_CONTAINER = php
MYSQL_CONTAINER = mysql
REDIS_CONTAINER = redis
NGINX_CONTAINER = nginx
NODEJS_CONTAINER = nodejs
REACTJS_CONTAINER = reactjs

USE_ORIGINAL_COMPOSE = -f ./docker/docker-compose.yml
USE_LOCAL_COMPOSE = -f ./docker/docker-compose.local.yml
USE_PROD_COMPOSE = -f ./docker/docker-compose.prod.yml

ifeq ($(ENV), production)
	COMPOSE_COMMAND = docker compose $(USE_PROD_ENV_FILES) $(USE_ORIGINAL_COMPOSE) $(USE_PROD_COMPOSE)
else
	COMPOSE_COMMAND = docker compose $(USE_LOCAL_ENV_FILES) $(USE_ORIGINAL_COMPOSE) $(USE_LOCAL_COMPOSE)
endif

build:
	$(COMPOSE_COMMAND) build

command:
	$(COMPOSE_COMMAND) $(ARGUMENT)
