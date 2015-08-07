#!/bin/bash
set -e

WORKSPACE=$(dirname $(dirname $(realpath $0)))

# Register the following lines to Jenkins
eval "$(/usr/local/bin/boot2docker shellinit)"

/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" build test
/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" up --no-color test
container_id="$(/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" ps -q test)"

# FIXME: Need more smart way. It's depend on an format of output of PHPUNIT.
if [ $(/usr/local/bin/docker logs ${container_id} | grep FAILURES | wc -l) -eq 0 ];
then code=0;
else code=2;
fi

/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" stop
/usr/local/bin/docker-compose --file "${WORKSPACE}/.docker/docker-compose.yml" rm -f
exit "${code}"
