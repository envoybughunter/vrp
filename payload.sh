#!/bin/bash

echo "echo 'pwned' > /tmp/pwned.txt" > /tmp/test.sh
chmod +x /tmp/test.sh
/tmp/test.sh
cat /tmp/pwned.txt




