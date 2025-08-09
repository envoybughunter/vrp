#!/bin/bash

echo "===== Searching for possible API keys and secrets in /home/* ====="

for userdir in /home/*; do
  echo "----- Scanning $userdir -----"

  # Belirli dosyalarda arama (config, env, history, json, yaml, ini vb.)
  find "$userdir" \( -name "*.env" -o -name "*.config" -o -name "*.json" -o -name "*.yml" -o -name "*.yaml" -o -name "*.ini" -o -name "*.bash_history" -o -name "*.sh" \) 2>/dev/null | while read file; do
    echo "Scanning file: $file"
    
    # API key, secret, token, password vb. gibi olabilecek patternleri grep ile ara:
    grep -Ei 'api[_-]?key|secret|token|password|access[_-]?key|private[_-]?key|auth' "$file" 2>/dev/null | head -10
  done

  # Ayrıca environment değişkenlerinde arama (ör. .profile, .bashrc, .bash_profile)
  for envfile in ".profile" ".bashrc" ".bash_profile" ".zshrc"; do
    f="$userdir/$envfile"
    if [ -f "$f" ]; then
      echo "Scanning environment file: $f"
      grep -Ei 'api[_-]?key|secret|token|password|access[_-]?key|private[_-]?key|auth' "$f" 2>/dev/null | head -10
    fi
  done
done

echo "===== Searching system-wide environment variables of running processes ====="

for pid in $(ps -e -o pid=); do
  if [ -r "/proc/$pid/environ" ]; then
    echo "--- /proc/$pid/environ for PID $pid ---"
    sudo tr '\0' '\n' < /proc/$pid/environ | grep -Ei 'api[_-]?key|secret|token|password|access[_-]?key|private[_-]?key|auth' | head -10
  fi
done
