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

### Requirements

* VirtualBox
* boot2docker
* docker
* docker-compose
