
make:
	@make up

up:
	# Launch virtualbox
	boot2docker up
	# Set environment variables like DOCKER_*.
	eval `boot2docker shellinit`
	# Run docker-compose.
	docker-compose up -d
	# You can get IP of the launched box by `bootdocker ip`
	@echo Access http://$$(boot2docker ip):5000 by browser.

build:
	docker-compose build

start:
	docker-compose start

stop:
	docker-compose stop

status:
	boot2docker status
	@echo
	docker-compose ps

halt:
	docker-compose stop
	boot2docker stop

hello:
	curl -v $(shell boot2docker ip):5000

mysql-repl:
	mysql -h$(shell boot2docker ip) -udev-user -pdev-pw dev-db

DATABASE_NAME = $(shell echo "$$(basename $$(pwd))_mysql_1")

mysql-root-repl:
	docker run -it --link $(DATABASE_NAME):mysql --rm mysql \
		sh -c 'exec mysql -h"$$MYSQL_PORT_3306_TCP_ADDR" -P"$$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
