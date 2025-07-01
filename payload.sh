#!/bin/bash

echo "==== SYSTEM INFORMATION ===="
uname -a
echo "==== HOSTNAME ===="
hostname
echo "==== /etc/passwd ===="
cat /etc/passwd

# Optional: test outbound connectivity or metadata access (commented for safety)
# echo "==== METADATA TEST ===="
# curl -s http://metadata.google.internal/computeMetadata/v1/ -H "Metadata-Flavor: Google"

# Optional: environment variables
# echo "==== ENVIRONMENT VARIABLES ===="
# printenv
