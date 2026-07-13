ARGUMENT?=

server-deploy:
	echo "Deploying to server..."
	docker compose -f server-setup.yml down
	docker system prune -af

	docker compose -f server-setup.yml --env-file .env.production --env-file .env pull
	docker compose -f server-setup.yml --env-file .env.production --env-file .env up -d --remove-orphans
	echo "Deployed to server successfully."

certbot-obtain:
	echo "Obtaining SSL certificates..."
	docker compose -f server-setup.yml -f certbot.yml --env-file .env.production --env-file .env up certbot
	echo "Obtained SSL certificates successfully."

certbot-renew:
	echo "Renewing SSL certificates..."
	docker compose -f server-setup.yml -f certbot.yml --env-file .env.production --env-file .env up certbot-renewal
	docker compose -f server-setup.yml -f certbot.yml --env-file .env.production --env-file .env exec -it nginx nginx -s reload
	echo "Renewed SSL certificates successfully."

access:
	docker compose -f server-setup.yml --env-file .env.production --env-file .env exec -it $(ARGUMENT)

command:
	docker compose -f server-setup.yml --env-file .env.production --env-file .env $(ARGUMENT)