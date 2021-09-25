#!/bin/bash
ip=$(curl ifconfig.me/ip);
sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config;
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config;
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config;
systemctl restart sshd;
clear;
echo -e "Masukkan Password:";
read -e pwe;
usermod -p `perl -e "print crypt("$pwe","Q4")"` root;
clear;
printf "Please Save This VPS Account Information
============================================
Ip address = $ip
Username   = root
Password   = $pwe
============================================";
echo "";
exit;
