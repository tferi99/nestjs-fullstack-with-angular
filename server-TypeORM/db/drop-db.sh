#!/usr/bin/env bash

set -e

POSTGRES_USER=postgres

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    DROP DATABASE todo_db;
    DROP USER todo;
EOSQL
