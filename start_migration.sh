#!/bin/sh
docker-compose -f migration.yml up -d;
docker logs -f gdrive-migrator;
