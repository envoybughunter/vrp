#!/bin/bash
find /home /etc /var/www -type f \( -name '*.env' -o -name '*.config' -o -name '*.ini' -o -name '*.json' \) -exec grep -iH 'password\|secret\|key\|token' {} + 2>/dev/null
