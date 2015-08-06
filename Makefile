

DOCKER_IP = $(shell boot2docker ip)
DOCKER_VARNISH_PORT = 5000

DOCKER_COMPOSE = $(shell which docker-compose)

ARTISAN = ./artisan

run-in-docker:
	$(DOCKER_COMPOSE) --file .docker/docker-compose.yml up -d

migrate:
	$(ARTISAN) migrate --env=docker

hello:
	curl -v $(DOCKER_IP):$(DOCKER_VARNISH_PORT)

