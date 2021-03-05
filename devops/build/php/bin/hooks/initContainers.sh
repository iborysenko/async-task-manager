#!/usr/bin/env bash

set -e
set -o pipefail

# run all startup scripts from dir
[ -d "/etc/my_init.d/init" ] && chmod +x -R /etc/my_init.d/init && run-parts /etc/my_init.d/init --verbose --exit-on-error