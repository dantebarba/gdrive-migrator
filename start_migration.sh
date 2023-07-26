#!/bin/sh
set -e

docker-compose -f migration.yml up -d;
docker logs -f gdrive-migrator;
