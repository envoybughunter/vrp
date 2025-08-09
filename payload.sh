#!/bin/bash

DIR=${1:-/home}

echo "Scanning $DIR for Google API keys and tokens..."

patterns=(
  'AIza[0-9A-Za-z-_]{35}'   # Google API Key
  'ya29\.[0-9A-Za-z\-_]+'   # Google OAuth Token
)

for p in "${patterns[@]}"; do
  grep -rI --color=always -E "$p" "$DIR" 2>/dev/null
done

echo "Scan completed."
