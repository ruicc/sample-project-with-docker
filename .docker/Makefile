
MAKEFILE_DIR=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

DOCKER_DEV=$(MAKEFILE_DIR)docker-dev

DOCKER_IP=$(shell docker-machine ip default)

make:

build:
	$(DOCKER_DEV) build

run:
	$(DOCKER_DEV) run

stop:
	$(DOCKER_DEV) stop

hello:
	curl -v $(DOCKER_IP):5000

mysql-repl:
	mysql -h$(DOCKER_IP) -udev-user -pdev-pw dev-db

DATABASE_NAME = $(shell echo "$$(basename $$(pwd))_mysql_1")

mysql-root-repl:
	docker run -it --link $(DATABASE_NAME):mysql --rm mysql \
		sh -c 'exec mysql -h"$$MYSQL_PORT_3306_TCP_ADDR" -P"$$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

# vim: set noet sw=4 ts=4 sts=4 :
