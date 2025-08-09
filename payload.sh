#!/bin/bash

echo "== World-writable directories without sticky bit (high risk) =="
find / -xdev -type d -perm -0002 ! -perm -1000 2>/dev/null

echo -e "\n== SUID/SGID root owned files (potential privilege escalation) =="
find / -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null

echo -e "\n== /etc/sudoers and users with sudo privileges =="
ls -l /etc/sudoers 2>/dev/null
grep -E '^[^#].*ALL' /etc/sudoers 2>/dev/null
getent group sudo 2>/dev/null
