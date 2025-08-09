#!/bin/bash

echo "===== Checking other user directories under /home ====="
for userdir in /home/*; do
  echo "----- Listing files in $userdir -----"
  ls -la "$userdir" 2>/dev/null

  echo "----- Attempting to read $userdir/.ssh/authorized_keys -----"
  cat "$userdir/.ssh/authorized_keys" 2>/dev/null

  echo "----- Attempting to read $userdir/.bash_history -----"
  cat "$userdir/.bash_history" 2>/dev/null
done

echo "===== Searching for SUID files ====="
find / -perm -4000 -type f 2>/dev/null

echo "===== Checking /etc/passwd for all users ====="
cat /etc/passwd 2>/dev/null

echo "===== Checking running processes owned by other users ====="
ps aux | awk -v user="$(whoami)" '$1 != user {print $0}' | head -20

echo "===== Attempting to read other users' environment variables (proc) ====="
for pid in $(ps -e -o pid=); do
  if [ -r "/proc/$pid/environ" ]; then
    echo "--- /proc/$pid/environ ---"
    sudo cat /proc/$pid/environ 2>/dev/null | tr '\0' '\n' | head -10
  fi
done
