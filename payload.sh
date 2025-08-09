#!/bin/bash

echo "== World-writable files with sticky bit OFF (çok riskli) =="
find / -xdev -type d -perm -0002 ! -perm -1000 2>/dev/null

echo -e "\n== SUID/SGID root izinli dosyalar (potansiyel privilege escalation) =="
find / -xdev \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null

echo -e "\n== /etc/sudoers ve sudo yetkisi olan kullanıcılar =="
ls -l /etc/sudoers 2>/dev/null
grep -E '^[^#].*ALL' /etc/sudoers 2>/dev/null
getent group sudo 2>/dev/null
