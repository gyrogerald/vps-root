#!/bin/bash
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/senowahyu62/Root-Vps/main/sshd_config;
systemctl restart sshd;
clear;
echo -e "Masukkan Password:";
read -e pwe;
usermod -p `perl -e "print crypt("$pwe","Q4")"` root;
clear;
printf "Please Save This VPS Account Information
============================================
Ip address = $(curl -Ls icanhazip.com)
Username   = root
Password   = $pwe
============================================";
echo "";
exit;
