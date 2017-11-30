#!/bin/sh
# api-entrypoint.sh

set -e

cmd="$@"
echo "HOST ${DB_HOST}"
while ! pg_isready -h "${DB_HOST}" -p "5432" > /dev/null 2> /dev/null; do
  echo "Waiting on Postgres on host ${DB_HOST}"
  sleep 5
done

>&2 echo "Postgres is up - executing command"

exec $cmd
