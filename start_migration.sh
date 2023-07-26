#!/bin/sh
set -e

mount -a /dev/sdd1 /mnt/disk1;
mount -a /dev/sdc1 /mnt/disk2;
mount -a /dev/sdf1 /mnt/disk3;

docker-compose -f migration.yml up -d;
docker logs -f gdrive-migrator;
