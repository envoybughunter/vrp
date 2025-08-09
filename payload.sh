#!/bin/bash

TARGET_DIR="$1"
TEST_FILE="$TARGET_DIR/poc_testfile"

echo "[*] Testing write/delete permissions in: $TARGET_DIR"

# Dosya oluştur
echo "PoC file created by $(whoami)" > "$TEST_FILE" 2>/dev/null
if [[ $? -ne 0 ]]; then
  echo "[-] Cannot create file in $TARGET_DIR"
  exit 1
fi
echo "[+] File created: $TEST_FILE"

# Dosyayı değiştir
echo "PoC modification by $(whoami)" >> "$TEST_FILE" 2>/dev/null
if [[ $? -ne 0 ]]; then
  echo "[-] Cannot modify file in $TARGET_DIR"
  exit 1
fi
echo "[+] File modified"

# Dosyayı sil
rm "$TEST_FILE" 2>/dev/null
if [[ $? -ne 0 ]]; then
  echo "[-] Cannot delete file in $TARGET_DIR"
  exit 1
fi
echo "[+] File deleted successfully"

echo "[*] PoC test completed."
