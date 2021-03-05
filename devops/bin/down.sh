#!/bin/bash
#combined docker compose file
COMPOSE_FILES="-f devops/deploy/local/docker-compose.yml -f devops/deploy/local/docker-compose-local.yml"
NAME_PREFIX=async

#ensure that old containers are removed
docker-compose -p $NAME_PREFIX $COMPOSE_FILES down -v --remove-orphans --rmi local