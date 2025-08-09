#!/bin/bash

for dir in /tmp /var/tmp /dev/shm; do
  perms=$(stat -c "%a" "$dir")
  if [[ $perms == 777 ]]; then
    echo "World-writable directory found: $dir (permissions: $perms)"
  else
    echo "Directory $dir permissions are safe (permissions: $perms)"
  fi
done
