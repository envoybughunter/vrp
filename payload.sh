#!/bin/bash
SEARCH_DIR=${1:-/home}

echo "Searching $SEARCH_DIR for sensitive keys and secrets..."

grep -r -E --color=auto \
  '(AKIA[0-9A-Z]{16})|(AIza[0-9A-Za-z-_]{35})|(ghp_[A-Za-z0-9]{36})|(xox[baprs]-[0-9]{12}-[0-9]{12}-[a-zA-Z0-9]{24})|(sk_live_[0-9a-zA-Z]{24})|(eyJ[A-Za-z0-9-_]{10,}\.[A-Za-z0-9-_]{10,}\.[A-Za-z0-9-_]{10,})|(password|passwd|secret|token)[ ]*[:=][ ]*["'\''a-zA-Z0-9@#$%^&*_-]{8,}' "$SEARCH_DIR" 2>/dev/null

echo "Done."
