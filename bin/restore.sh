#!/usr/bin/env bash

docker exec -i postgresql psql -U postgres -d sqlda < ${PWD}/docker-entrypoint-initdb.d/dump.sql
