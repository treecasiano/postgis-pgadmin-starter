#!/usr/bin/env bash

docker inspect sqlda-container | jq '.[0].NetworkSettings.Networks."sql-for-data-analytics-study_default".IPAddress'
