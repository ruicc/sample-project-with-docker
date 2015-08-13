
PROJECT_ROOT = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

ARTISAN = .laravel/artisan

PHPUNIT = vendor/bin/phpunit

DOCKER_IP = $(shell docker-machine ip default)

DOCKER_LB_PORT = 5000

make:

run-docker:
	cd .docker && make build && make run

stop-docker:
	cd .docker && make stop

# TODO
#test-in-docker:

migrate-docker:
	# Check config/database.php to see how it switches database host.
	DOCKER_DB_HOST=$(DOCKER_IP) $(ARTISAN) migrate --env=docker

hello:
	curl -v $(DOCKER_IP):$(DOCKER_LB_PORT)/user

test:
	cd .laravel && $(PHPUNIT)
