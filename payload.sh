#!/bin/bash

SEARCH_DIR=${1:-/home}

echo "==== Starting comprehensive sensitive info scan on $SEARCH_DIR ===="

# Hassas bilgi regex desenleri (daha fazla eklenebilir)
declare -A patterns=(
  ["AWS Access Key"]="AKIA[0-9A-Z]{16}"
  ["Google API Key"]="AIza[0-9A-Za-z-_]{35}"
  ["Google OAuth Token"]="ya29\.[0-9A-Za-z\-_]+"
  ["JWT Token"]="eyJ[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+"
  ["GitHub Token"]="ghp_[A-Za-z0-9]{36}"
  ["Slack Token"]="xox[baprs]-[0-9]{12}-[0-9]{12}-[a-zA-Z0-9]{24}"
  ["Stripe Secret"]="sk_live_[0-9a-zA-Z]{24}"
  ["Database URL"]="(postgres|mysql|mongodb|redis)://[^\s]+"
  ["Private Key Start"]="-----BEGIN (RSA|DSA|EC|OPENSSH|PGP|PRIVATE) KEY-----"
)

echo ">> Searching files for sensitive patterns..."
for name in "${!patterns[@]}"; do
  pattern=${patterns[$name]}
  echo -e "\n-- Pattern: $name --"
  grep -rI --color=always -E "$pattern" "$SEARCH_DIR" 2>/dev/null || echo "No matches for $name"
done

echo -e "\n>> Searching for common secret/config files:"
secret_files=(
  ".env"
  ".aws/credentials"
  ".ssh/id_rsa"
  ".ssh/id_dsa"
  ".pgpass"
  "config.php"
  "settings.py"
  "database.yml"
  "credentials.json"
)

for file in "${secret_files[@]}"; do
  echo -e "\n-- Searching for $file files --"
  find "$SEARCH_DIR" -type f -name "$file" -exec ls -lh {} \; 2>/dev/null
done

echo -e "\n>> Searching for SUID files (possible privilege escalation):"
find / -perm -4000 -type f 2>/dev/null | head -30

echo -e "\n>> Listing running processes of other users with their environment variables (limited):"
ps aux | awk -v user="$(whoami)" '$1 != user {print $0}' | head -10

echo -e "\n>> Attempting to read environment variables of running processes (limited output):"
for pid in $(ps -e -o pid= | head -20); do
  if [ -r "/proc/$pid/environ" ]; then
    echo "--- /proc/$pid/environ for PID $pid ---"
    sudo tr '\0' '\n' < /proc/$pid/environ | head -10 2>/dev/null
  fi
done

echo -e "\n>> Checking for shell history files with possible secrets:"
history_files=(".bash_history" ".zsh_history" ".history")
for userdir in "$SEARCH_DIR"/*; do
  for histfile in "${history_files[@]}"; do
    target="$userdir/$histfile"
    if [ -f "$target" ]; then
      echo "Found history: $target"
      head -20 "$target"
    fi
  done
done

echo -e "\n==== Scan completed ===="
