#!/bin/bash

for dir in /tmp /var/tmp /dev/shm; do
  perms=$(stat -c "%a" "$dir")
  sticky=$(ls -ld "$dir" | awk '{print substr($1,10,1)}')
  echo -n "Checking $dir : permissions=$perms, sticky_bit=$sticky -> "
  if [[ $perms == 777 && $sticky != "t" ]]; then
    echo "CRITICAL: World-writable without sticky bit!"
  else
    echo "OK"
  fi
done
