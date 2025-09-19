#!/bin/bash

DATABASE="postgres"
DB_PORT="${POSTGRES_PORT:=5432}"
DB_HOST="${POSTGRES_HOST:=localhost}"
RUNNING_CONTAINER=$(docker ps --filter "name=$DATABASE" --format '{{.Names}}')
CONTAINER_NAME="${RUNNING_CONTAINER:-${DATABASE}_container}"
POSTGRES_ROOT_USER="${POSTGRES_ROOT_USER:=postgres}"

docker exec -it $CONTAINER_NAME psql -h "${DB_HOST}" -U "${POSTGRES_ROOT_USER}" -p "${DB_PORT}" -d "${DATABASE}"

