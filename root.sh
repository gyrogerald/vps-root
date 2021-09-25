#!/bin/bash
ip=$(curl ifconfig.me/ip);
apt update -y;apt install whois -y;
sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd
read -e "Masukkan Password:" pwe
usermod -p `perl -e "print crypt("$pwe","Q4")"` root
echo ""
printf "Please Save This VPS Account Information
============================================
Ip address = $ip
Username   = $user
Password   = $pwe
============================================"
sleep 1
echo ""
exit
