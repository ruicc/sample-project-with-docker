## A sample project with docker

It's important for developer to run code in a consistent environment.

### Problems

How do developers combine docker with their existing project?

* Developers don't want to learn a new tool(docker)
* An existing project might have several constraints on an environment
* Edit-build-run cycle shouldn't be slow

### Approach

* All code about docker is in .docker directory
* Several commands are in Makefile to launch docker
* Projects have a Dockerfile
	* Only project knows the way to run itself in a container


## A sample project with laravel-tools

How do we add laravel tools(migration, seeder, phpunit, ...) into existing project?

### Approach

* All code about laravel is in .laravel directory

## Provided Featureas

* Docker as an Environment of running web application
* Migration tools
* Testing tools
* Support Jenkins for CI

## Requirements

* VirtualBox
* boot2docker
* docker
* docker-compose

## How to use

1. Make sure `boot2docker` is running and environment variables to access Docker are set unless on Linux
2. `make run-in-docker`

## Jenkins integration

Check .laravel/jenkins-ci.sh and register the part of it to Jenkins as a shell script.


## Known Issues

* Performance issue due to "shared-folder" by VirtualBox
