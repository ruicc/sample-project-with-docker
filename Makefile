

BOOT2DOCKER_IP = $(shell boot2docker ip)
DOCKER_VARNISH_PORT = 5000

DOCKER_COMPOSE = docker-compose --file .docker/docker-compose.yml

ARTISAN = .laravel/artisan

run-in-docker:
	$(DOCKER_COMPOSE) up -d

stop-docker:
	$(DOCKER_COMPOSE) stop

start-boot2docker:
	boot2docker up
	eval "$$(boot2docker shellinit)"

stop-boot2docker:
	boot2docker stop

migrate:
	# Check config/database.php to see how it switches database host.
	DOCKER_DB_HOST=$(BOOT2DOCKER_IP) $(ARTISAN) migrate --env=docker

hello:
	curl -v $(BOOT2DOCKER_IP):$(DOCKER_VARNISH_PORT)

