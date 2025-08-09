#!/bin/bash

echo "=== SUID/SGID bitli dosyalar (potansiyel privilege escalation) ==="
find / -perm /6000 -type f 2>/dev/null

echo -e "\n=== World-writable dosya ve dizinler (777 gibi) ==="
find / -writable -type d -perm -002 2>/dev/null

echo -e "\n=== Zayıf izinli /etc/passwd ve /etc/shadow dosyaları ==="
ls -l /etc/passwd /etc/shadow 2>/dev/null

echo -e "\n=== Sudo yetkisi olan kullanıcılar ==="
getent group sudo 2>/dev/null || getent group wheel 2>/dev/null

echo -e "\n=== SSH authorized_keys dosyaları ==="
find /home /root -name authorized_keys -exec ls -l {} \; 2>/dev/null
