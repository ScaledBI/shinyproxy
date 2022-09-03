#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Retrieve Postgres user and password for usage statistics
# In production you should nt hardcode these
POSTGRES_USERNAME="shinyproxy"
POSTGRES_PASSWORD="password"
export POSTGRES_USERNAME
export POSTGRES_PASSWORD

# Run application
java -jar shinyproxy.jar &

# Wait for exit signals
wait -n
