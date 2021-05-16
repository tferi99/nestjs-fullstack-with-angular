#!/usr/bin/env bash

set -e

POSTGRES_USER=postgres

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER todo;
    CREATE DATABASE todo_db;
    GRANT ALL PRIVILEGES ON DATABASE todo_db TO todo;

    ALTER USER todo WITH PASSWORD 'password123';
    ALTER USER todo WITH SUPERUSER;
EOSQL
