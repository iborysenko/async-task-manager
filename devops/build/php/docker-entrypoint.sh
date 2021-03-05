#!/bin/sh

set -e
set -o pipefail

_term() {
  echo "Caught SIGTERM signal!"
  php bin/rr stop
}

trap _term SIGTERM

# run ppm
if [ "$APP_RUN_SERVER" == "yes" ]; then
  if [ "$APP_ENV_NAME" == "local" ]; then
    bin/rr serve -c .rr.dev.yaml --debug
  fi
  if [ "$APP_ENV_NAME" == "prod" ]; then
    bin/rr serve rr.yaml
  fi
else
   while sleep 3600; do :; done
fi