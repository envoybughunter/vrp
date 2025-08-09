#!/bin/bash
SEARCH_DIR=${1:-/home}

echo "Scanning $SEARCH_DIR for sensitive tokens..."

grep -r -E --color=auto \
  'AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z-_]{35}|ghp_[A-Za-z0-9]{36}' "$SEARCH_DIR" 2>/dev/null

echo "Scan finished."
