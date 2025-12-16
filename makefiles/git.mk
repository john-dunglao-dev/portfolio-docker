COMMAND = docker compose
COMPOSE_FILES = -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml

production-build-reactjs:
	$(COMMAND) $(COMPOSE_FILES) build reactjs

production-build-vuejs:
	$(COMMAND) $(COMPOSE_FILES) build nodejs

production-build-php:
	$(COMMAND) $(COMPOSE_FILES) build php

production-build-mysql:
	$(COMMAND) $(COMPOSE_FILES) build mysql

production-build-redis:
	$(COMMAND) $(COMPOSE_FILES) build redis

production-build-nginx:
	$(COMMAND) $(COMPOSE_FILES) build nginx



production-push-reactjs:
	$(COMMAND) $(COMPOSE_FILES) push reactjs

production-push-vuejs:
	$(COMMAND) $(COMPOSE_FILES) push nodejs

production-push-php:
	$(COMMAND) $(COMPOSE_FILES) push php

production-push-mysql:
	$(COMMAND) $(COMPOSE_FILES) push mysql

production-push-redis:
	$(COMMAND) $(COMPOSE_FILES) push redis

production-push-nginx:
	$(COMMAND) $(COMPOSE_FILES) push nginx


production-deploy:
	set -e
	cd /opt/portfolio

	echo "Pulling latest images from Docker Registry..."
	$(COMMAND) $(COMPOSE_FILES) pull

	echo "Recreating and starting containers..."
	$(COMMAND) $(COMPOSE_FILES) down
	$(COMMAND) $(COMPOSE_FILES) up -d --remove-orphans

	echo "Pruning unused Docker resources..."
	$(COMMAND) image prune -f

	echo "Deployment completed successfully."


