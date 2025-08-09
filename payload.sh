#!/bin/bash

echo "Scanning for files with sensitive keywords (password, secret, key, token)..."

find /home /etc /var/www -type f \( -name '*.env' -o -name '*.config' -o -name '*.ini' -o -name '*.json' \) \
  -exec grep -i -H 'password\|secret\|key\|token' {} \; 2>/dev/null

echo "Scan completed."
