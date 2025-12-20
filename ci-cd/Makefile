ARGUMENT?=

server-deploy:
	echo "Deploying to server..."
	docker compose -f server-setup.yml down
	docker system prune -af

	docker compose -f server-setup.yml pull
	docker compose -f server-setup.yml --env-file .env.production up -d --remove-orphans
	echo "Deployed to server successfully."

certbot-obtain:
	echo "Obtaining SSL certificates..."
	docker compose -f server-setup.yml -f certbot.yml --env-file .env.production up certbot
	echo "Obtained SSL certificates successfully."

certbot-renew:
	echo "Renewing SSL certificates..."
	docker compose -f server-setup.yml -f certbot.yml --env-file .env.production up certbot-renewal
	echo "Renewed SSL certificates successfully."

command:
	docker compose -f server-setup.yml --env-file .env.production $(ARGUMENT)