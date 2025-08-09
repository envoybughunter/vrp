#!/bin/bash

for dir in /tmp /var/tmp /dev/shm; do
  perms=$(stat -c "%a" "$dir")
  if [[ $perms == 777 ]]; then
    echo "World-writable directory found: $dir (permissions: $perms)"
  fi
done
