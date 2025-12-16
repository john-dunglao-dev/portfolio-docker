GITHUB_SHA?=latest
COMMAND = docker compose
COMPOSE_FILES = -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml

production-build-php:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) build php

production-build-nginx:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) build nginx

production-push-php:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) push php

production-push-nginx:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) push nginx

