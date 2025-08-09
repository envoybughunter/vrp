#!/bin/bash

echo "===== /etc/passwd ====="
cat ../../../../../../../etc/passwd 2>/dev/null

echo "===== /etc/shadow (izin varsa) ====="
cat ../../../../../../../etc/shadow 2>/dev/null

echo "===== /proc/self/environ ====="
cat ../../../../../../../proc/self/environ 2>/dev/null

echo "===== /proc/self/status ====="
cat ../../../../../../../proc/self/status 2>/dev/null

echo "===== /proc/self/cmdline ====="
cat ../../../../../../../proc/self/cmdline 2>/dev/null

echo "===== /proc/version ====="
cat ../../../../../../../proc/version 2>/dev/null

echo "===== /etc/hostname ====="
cat ../../../../../../../etc/hostname 2>/dev/null

echo "===== /etc/resolv.conf ====="
cat ../../../../../../../etc/resolv.conf 2>/dev/null

echo "===== /etc/hosts ====="
cat ../../../../../../../etc/hosts 2>/dev/null

echo "===== Çevre Değişkenleri ====="
printenv 2>/dev/null

echo "===== Mevcut Kullanıcı ====="
whoami 2>/dev/null

echo "===== Kullanıcı Grupları ====="
groups 2>/dev/null

echo "===== Disk Kullanımı ====="
df -h 2>/dev/null

echo "===== Aktif Ağ Bağlantıları ====="
netstat -tuln 2>/dev/null

echo "===== Çalışan Prosesler ====="
ps aux 2>/dev/null | head -20

echo "===== Çalışma Dizinleri ====="
pwd 2>/dev/null

echo "===== Listelenen Dizin İçeriği (bulunduğun dizin) ====="
ls -la 2>/dev/null
