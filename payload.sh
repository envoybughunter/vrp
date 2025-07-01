#!/bin/bash

echo "=== LOADED KERNEL MODULES ==="
lsmod


echo "=== RUNNING SERVICES ==="
systemctl list-units --type=service --state=running


echo "=== COMMAND INJECTION TEST ==="
ls; echo "Injected command executed"


echo "echo 'pwned' > /tmp/pwned.txt" > /tmp/test.sh
chmod +x /tmp/test.sh
/tmp/test.sh
cat /tmp/pwned.txt


echo "=== SUDO PRIVILEGES ==="
sudo -l 2>/dev/null

