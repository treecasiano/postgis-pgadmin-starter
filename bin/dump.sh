#!/usr/bin/env bash

docker exec sqlda-container sh -c 'exec pg_dump -h 127.0.0.1 -U postgres sqlda' > ${PWD}/docker-entrypoint-initdb.d/dump.sql
