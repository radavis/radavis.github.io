#!/usr/bin/env bash

folder_checksum() {
  echo `tar -cf - $1 | md5`
}

timestamp() {
  echo `date "+%Y%m%d %H%M%S"`
}

script=`basename "$0"`
first_run=true
pathname=$1
initial_checksum=$(folder_checksum $pathname)

while true; do
  current_checksum=$(folder_checksum $pathname)

  if [ $initial_checksum != $current_checksum ]; then
    current_timestamp=$(timestamp)
    echo "$script: publishing changes at $current_timestamp"
    git add .
    git commit -m "auto-commit $pathname at $current_timestamp"
    git push origin HEAD
    initial_checksum=$current_checksum
  fi

  if [[ "$first_run" == "true" && $initial_checksum == $current_checksum ]]; then
    echo "$script: no changes, yet..."
    first_run=false
  fi

  sleep 30
done
