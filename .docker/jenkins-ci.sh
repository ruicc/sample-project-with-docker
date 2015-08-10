#!/bin/bash
set -e

WORKSPACE=$(dirname $(dirname $(realpath $0)))

# Register the following lines to Jenkins
pushd "${WORKSPACE}/.laravel" && make && popd

eval "$(/usr/local/bin/boot2docker shellinit)"

/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" build test
code=$(/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" up --no-color test | \
	tee /dev/fd/2 | grep 'exited with code' | cut -d' ' -f5)

/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" stop
/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" rm -f
exit "${code}"
