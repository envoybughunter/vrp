#!/bin/bash

# Arama yapılacak dizin (default /home)
SEARCH_DIR=${1:-/home}

echo "Scanning directory: $SEARCH_DIR for sensitive keys and tokens..."

# Aranacak regex patternleri (gerekirse ekleyebilirsin)
patterns=(
  'AKIA[0-9A-Z]{16}'                                  # AWS Access Key ID
  'AIza[0-9A-Za-z-_]{35}'                             # Google API Key
  'ya29\.[0-9A-Za-z\-_]+'                             # Google OAuth Token
  'eyJ[A-Za-z0-9_\-]{10,}\.[A-Za-z0-9_\-]{10,}\.[A-Za-z0-9_\-]{10,}' # JWT Token (basit)
  'ghp_[A-Za-z0-9]{36}'                               # GitHub Personal Access Token
  '[a-z0-9]{40}'                                      # Genel 40 karakterli token (örnek: GitHub)
  'xox[baprs]-[0-9]{12}-[0-9]{12}-[a-zA-Z0-9]{24}'   # Slack Token
  'SK\.[A-Za-z0-9]{32,}'                              # Stripe Secret Key
)

for pattern in "${patterns[@]}"; do
  echo -e "\nSearching for pattern: $pattern"
  grep -r -I --color=always -E "$pattern" "$SEARCH_DIR" 2>/dev/null
done

echo -e "\nScan complete."
