#!/usr/bin/env bash

docker inspect sqlda-container | jq '.[0].NetworkSettings.Networks."postgis-pgadmin-starter_default".IPAddress'
