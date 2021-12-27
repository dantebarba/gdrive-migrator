#!/bin/sh
rclone copy old-gdrive: new-gdrive: --min-age 100y --create-empty-src-dirs --min-size 9999G --config rclone.conf --log-level DEBUG --drive-server-side-across-configs;
