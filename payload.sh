#!/bin/bash
echo "=== SUID/SGID bitli dosyalar (potansiyel privilege escalation) ==="
find / -perm /6000 -type f 2>/dev/null

echo "=== World-writable dosya ve dizinler (777 gibi) ==="
find / -xdev -type d -perm -0002 -ls 2>/dev/null
find / -xdev -type f -perm -0002 -ls 2>/dev/null

echo "=== /etc/passwd ve /etc/shadow izin kontrolü ==="
ls -l /etc/passwd /etc/shadow 2>/dev/null

echo "=== /root ve diğer kritik dizin izinleri ==="
ls -ld /root /etc /var/log 2>/dev/null

echo "=== SSH authorized_keys izinleri ve içeriği ==="
for userdir in /home/*; do
  if [ -f "$userdir/.ssh/authorized_keys" ]; then
    echo "User: $(basename $userdir)"
    ls -l "$userdir/.ssh/authorized_keys"
    head -5 "$userdir/.ssh/authorized_keys"
  fi
done

echo "=== Root olarak çalışan süreçler (pid, user, komut) ==="
ps -U root -u root u

echo "=== .bash_history ve benzeri shell geçmiş dosyaları ==="
find /home -name ".*_history" -exec ls -l {} \; -exec head -5 {} \; 2>/dev/null

echo "=== /etc/sudoers dosyası ve sudo yetkileri ==="
ls -l /etc/sudoers
cat /etc/sudoers | grep -vE '^#|^$'

echo "=== Sudo yetkisi olan kullanıcılar ==="
getent group sudo

echo "=== Sonuçlar tamamlandı ==="
