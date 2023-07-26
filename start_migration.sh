#!/bin/sh
set -e

mount /dev/sdd1 /mnt/disk1;
mount /dev/sdc1 /mnt/disk2;
mount /dev/sdf1 /mnt/disk3;

docker-compose -f migration.yml up -d;
docker logs -f gdrive-migrator;
