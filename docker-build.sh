#!/usr/bin/env bash
set -euxo pipefail

function cleanup {
  docker-compose down
}
trap cleanup EXIT

mkdir node_modules
docker-compose up -d --build && docker-compose run app npm run pre-commit

#docker cp "app:/usr/src/app/build" .
