#!/bin/sh
rclone copy ${LOCAL_FS} gdrive: --min-age 100y --create-empty-src-dirs --min-size 9999G --config rclone.conf --log-level DEBUG --drive-server-side-across-configs;
