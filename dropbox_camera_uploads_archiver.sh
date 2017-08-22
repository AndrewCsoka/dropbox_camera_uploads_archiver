#!/bin/bash

enddate=$(date +"%Y-%m-01" --date="$(date -I) next month")

echo "Starting at $(date)"

d="$START_DATE"
while [ "$d" != "$enddate" ]; do
  YEAR_MONTH=$(date +%Y-%m -d "$d")
  echo Trying: $YEAR_MONTH
  rclone move Dropbox:Camera\ Uploads --include "${YEAR_MONTH}-*" Dropbox:${ARCHIVE_DIR}/${YEAR_MONTH}/ --retries $RETRIES
  d=$(date -I -d "$d + 1 month")
done
