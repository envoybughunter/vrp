#!/bin/bash

echo "Eğer sudo ayrıcalığınız varsa, root yetkisiyle dosya oluşturulacak..."
sudo bash -c "echo 'PWNED' > /root/pwned.txt"
