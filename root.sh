#!/bin/bash
clear
ip=$(wget -qO- ifconfig.me/ip);
apt update -y;apt upgrade -y;apt install whois -y;
sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd
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
exit
