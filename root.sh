#!/bin/bash
wget -O /etc/ssh/sshd_config wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/senowahyu62/Root-Vps/main/sshd_config
systemctl restart sshd
ip=$(curl ifconfig.me/ip)
clear
sleep 1
printf "
 ____           _             _ 
|  _ \    ___  | |_    ___   | |
| | | |  / _ \ | __|  / _ \  | |
| |_| | |  __/ | |_  | (_) | | |
|____/   \___|  \__|  \___/  |_|
"                                
echo
echo "Cara Mudah Untuk Root Dan Login Vps"
echo "============================================"
user=root
echo "Masukkan Password: " 
read -e pw
pwe=$(mkpasswd $pw)

clear
usermod --password $pwe $user
clear

echo ""
printf "Please Save This VPS Account Information
============================================
Ip address = $ip
Username   = $user
Password   = $pw
============================================"
sleep 1
echo ""
echo 
exit
