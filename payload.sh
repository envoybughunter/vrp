#!/bin/bash
echo "[vuln.sh] 127.0.0.1:"
read USER_INPUT
echo "[vuln.sh] Çalıştırılıyor ➜ $USER_INPUT"
bash -c "$USER_INPUT"
