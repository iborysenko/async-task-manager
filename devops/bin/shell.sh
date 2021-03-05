#!/bin/bash
#combined docker compose file
COMPOSE_FILES="-f devops/deploy/local/docker-compose.yml -f devops/deploy/local/docker-compose-local.yml"
NAME_PREFIX=async

docker-compose -p $NAME_PREFIX $COMPOSE_FILES exec $@ sh