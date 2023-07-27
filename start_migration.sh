#!/bin/sh
set -e

# Set default values for $1 and $2 if not provided
directory=${1:-"/mnt/pool"}
threshold=${2:-"1T"}

./check_space.sh "$directory" "$threshold"

if [ $? -ne 0 ]; then
  echo "Exiting script due to an error in check_space.sh."
  exit 1
fi

docker-compose -f migration.yml up -d;
docker logs -f gdrive-migrator;
