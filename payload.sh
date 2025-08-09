#!/bin/bash

for dir in /go /go/bin /go/src; do
  perms=$(stat -c "%a" "$dir")
  sticky=$(stat -c "%A" "$dir" | grep -o 't')
  if [[ $perms == *7 ]] && [[ -z $sticky ]]; then
    echo "Warning: $dir is world-writable without sticky bit — files can be modified or deleted by others."
  fi
done
