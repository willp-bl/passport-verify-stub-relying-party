#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

export RANDOM_ENTITY_ID=http://verify-service-provider-acceptance-test-$RANDOM

echo "starting service provider container"
docker build . -f vsp.Dockerfile -t vsp
docker run -d -p 50400:50400 -e RANDOM_ENTITY_ID=$RANDOM_ENTITY_ID --name vsp vsp

echo "start the database container"
docker build . -f db.Dockerfile -t stub-rp-test-db
docker run -d -p 5432:5432 --name stub-rp-test-db stub-rp-test-db

echo "building"
yarn install

echo "running tests"
npm run pre-commit

echo "shutdown database and vsp containers container"
#docker stop vsp
#docker rm vsp
#docker stop stub-rp-test-db
#docker rm stub-rp-test-db
