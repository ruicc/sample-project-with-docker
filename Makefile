
PROJECT_ROOT = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKER_COMPOSE = $(shell which docker-compose) --file $(PROJECT_ROOT)/.docker/docker-compose.yml

ARTISAN = .laravel/artisan

PHPUNIT = vendor/bin/phpunit

BOOT2DOCKER = $(shell which boot2docker)

BOOT2DOCKER_IP = $(shell $(BOOT2DOCKER) ip)

DOCKER_VARNISH_PORT = 5000

make:

run-in-docker:
	$(DOCKER_COMPOSE) up -d web datamysql varnish

stop-docker:
	$(DOCKER_COMPOSE) stop

test-in-docker:
	$(DOCKER_COMPOSE) build test
	$(DOCKER_COMPOSE) up test
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

test:
	cd .laravel && $(PHPUNIT)
