#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/dropbox_camera_uploads_archiver.conf

END_DATE=$(date +"%Y-%m-01" --date="$(date -I) next month")

echo "Starting at $(date)"

d="$START_DATE"
while [ "$d" != "$END_DATE" ]; do
  YEAR_MONTH=$(date +%Y-%m -d "$d")
  echo Trying: $YEAR_MONTH
  rclone move Dropbox:Camera\ Uploads --include "${YEAR_MONTH}-*" Dropbox:${ARCHIVE_DIR}/${YEAR_MONTH}/ --retries ${RETRIES} --verbose
  d=$(date -I -d "$d + 1 month")
done
