#!/bin/bash

SEARCH_DIR=${1:-/home}

echo "Scanning directory: $SEARCH_DIR for GitHub tokens..."

patterns=(
  'ghp_[A-Za-z0-9]{36}'    # GitHub Personal Access Token
)

for pattern in "${patterns[@]}"; do
  grep -rI --color=always -E "$pattern" "$SEARCH_DIR" 2>/dev/null
done

echo "Scan completed."
