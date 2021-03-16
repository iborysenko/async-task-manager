#!/bin/bash

set -e
set -o pipefail

_term() {
  echo "Caught SIGTERM signal!"
  php /usr/bin/rr stop
}

trap _term SIGTERM

# run ppm
if [ "$APP_RUN_SERVER" == "yes" ]; then
  if [ "$APP_ENV_NAME" == "local" ]; then
    /usr/bin/rr serve -c .rr.dev.yaml --debug
  fi
  if [ "$APP_ENV_NAME" == "prod" ]; then
    /usr/bin/rr serve rr.yaml
  fi
else
   sleep infinity &
fi

child=$!

wait $child