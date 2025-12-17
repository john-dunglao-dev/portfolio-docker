GITHUB_SHA?=latest
COMMAND = docker compose
COMPOSE_FILES = -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml
BUILD_ARG?=

production-build-php:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) build php $(BUILD_ARG)

production-build-nginx:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) build nginx $(BUILD_ARG)

production-push-php:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) push php

production-push-nginx:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) push nginx

production-build:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) build $(BUILD_ARG)

production-push:
	GITHUB_SHA=$(GITHUB_SHA) $(COMMAND) $(COMPOSE_FILES) push