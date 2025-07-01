#!/bin/bash

echo "==== GCP Metadata Token ===="
curl -s "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/token" \
  -H "Metadata-Flavor: Google"
