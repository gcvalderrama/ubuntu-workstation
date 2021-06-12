sudo apt install net-tools
sudo apt  install nmap 
sudo apt install chrony
sudo apt install firewalld
sudo apt install apparmor-utils
# raspberry setup 
# https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#2-prepare-the-sd-card
sudo snap install rpi-imager

# scan network
sudo apt-get install arp-scan
sudo arp-scan --interface=eno1 --localnet | grep Raspberry

# create ssh key for raspberry access 
ssh-keygen -f ~/.ssh/minionkey

# ssh-copy-id -i ~/.ssh/minionkey ubuntu@192.168.18.35

# login ubuntu 
# ssh ubuntu@192.168.18.35

cat /etc/passwd

sudo groupadd developers
sudo groupadd sres
sudo groupadd stakeholders 


# groupdel 

useradd -D

# /etc/login.defs
# /etc/skell default directory 

# id gregory
# getent passwd gregory

sudo useradd greg
sudo useradd cesar
sudo useradd caesar

# userdel 

sudo usermod -G developers greg
sudo usermod -G sres cesar
sudo usermod -aG stakeholders caesar

# passwd

# echo developer | 

sudo passwd caesar


ls -l /etc/passwd /etc/shadow /etc/group /etc/gshadow

## current sessions
#w
#who
#getent access password databases 
#chage passsword policies

loginctl list-sessions
loginctl show-user gregory
loginctl session-status 2


#            file   dir 
# read  4    open   list
# write  2   modify create/delete
# execute 1  run    cd

# permissions
# User Ggroup Owner 
# chown user:group file 
# chgrp 

# mode 
# chmod 

# advance permissions 

#            file                 dir 
# suid 4    run as owner          -                                chmod u+s file 
# sgid 2    run as group owner    inherit directory group owner    chmod g+s directory useful share
# sticky 1    -                   delete if you are owner          chmod +t directory don't delete files

# chmod 4770 file

# find / -perm /4000

# umask  022 default permission to 644 , 027 default to 750 
# fdisk  gdisk 
lsblk

#mkfs to create filesystem  


lsof /home/gregory/work
findmnt

# network 

ip a 

ip route show

cat /etc/resolv.conf

ip route add default via 192.168.1.0

hostname -I # all ips 

hostnamectl

# etc/nsswitch configuraate priorities to resolve dns 
# dns /etc/hosts

ping -f -s 4096 google.com

netstat -tulpen 

ss -tuna

nmap 192.168.18.16

dig google.com

# time 
date 
timedatectl

# hwclock -s - w to modify  

sudo hwclock

 chronyc sources

 # ntpdate pool.ntp.org to set ntp from org

 # system d
# default units
# /usr/lib/systemd/system 
# custom units /etc/systemd 
systemctl -t help # show unit types
systemctl list-unit-files # list all installed units
systemctl list-units # list active units

systemctl enable name.service # enables 
systemctl start name.service #  
systemctl disable name.service # 
systemctl stop name.service #  
systemctl status name.service # 

systemctl cat  cron.service

systemctl show cron.service

systemctl edit cron.service

systemctl daemon-reload 

systemctl start cron.service
systemctl status cron.service

# target is a group of services like emergency.target , multi user targetr 

systemctl list-dependencies sound.target  
systemctl list-units | grep target
systemctl start name.target # start alll service in target
systemcrl isolate name.target # service only for that target
systemctl get-default 
systemctl set-default name.target 

# Process management 

# jobs 
dd if=/dev/zero of=/dev/null & # coping nothing forever

jobs 

fg 6 # bring 

top 
top -u gregory 

ps aux | less
ps aux | grep  ssh

ps -ef 

ps fax # tree view 

ps aux --sort pmem


# nice to start
# renice -n 5 PID to modify 
# top  key r 

kill 
kill -9 
killall dd 

# review lib dependencies 
ldd /usr/bin/passwd
# yum repolist
# /etc/yum.repos.d
# yum search nmap
# yum verivy
# yum list installed 
# yum remove nmap
# yum update 

# /etc/apt/source.list.d

apt search nmap
apt remove nmap

# schedule task 
cat /etc/crontab
ls /etc/cron.d
crontab -e
at 
systemctl status crond


crontab -e

# change /usr/lib/systemd/system
# vim fstrim.timer 
# systemctl enable fstrim.timer
# systemctl start fstrim.timer

touch /etc/cron.daily/any.cron

#!/bin/bash


# at 12:12

systemctl status atd # ensure
at # create 
atq # query  
atrm 1 # remove queue



# logging  

systemctl status systemd-journald 

journalctl
journalctl -u tab tab
journalctl -u sshd
journalctl --dmesg # shows kernel messages 
journalctl -u crond --since yesterday --until 9:00 -p info

ls  /etc/rsyslog.*
logger hello

# android development 
sudo apt install openjdk-11-jdk
sudo add-apt-repository ppa:maarten-fonville/android-studio


# resource limitations 
cat /etc/security/limits.conf # prefer cgroups 
#chvt 1 change virtual directory

# secure mount options 
# vim /etc/fstab  to restrict mount options default noexec

systemctl status NetworkManager

nmtui # network ui
nmcli # network

#unbuntu configurations /etc/network/interfaces
# sudo netplan apply 
# /etc/netplan/50-cloud...


systemctl disable NetworkManager
systemcrl enable systemd-networkd
systemctl enable systemd-resolved
rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
ls -l /etc/resolv.conf

mkdir /etc/systemd/network
cd /etc/systemd/network
ip link show

# advance system ctl 

systemctl show unit.type
systemctl edit unit.type
systemctl daemon-reload
systemctl restart unit.type

systemctl cat httpd.service 

systemctl show httpd.service

systemctl status httpd.service -l 

systemctl list-unit-files | grep socket

systemctl list-unit-files | grep timers 

systemctl enable --now name

#cgroups

cd /etc/systemd/system
cat stress.service

touch stress.service

[Unit]
Description=Create some stress

[Service]
Type=simple
ExecStart=/usr/bin/dd if=/dev/zero of=/dev/null
CPUShares=1024

systemctl daemon-reload

config logs

/etc/rsyslog/rsyslog.conf

/etc/rsyslog.d



ss -tuna 

#log rotation 
#/etc/logrotate.conf and drop in /etc/logrotate.d

persitent /etc/systemd/journald.conf 

kernel 

lsmod list modules that are currently loades
modinfo provides more informacion 
modprobe is used to load kernet modules
modprobe -r is used to unload modules

lspci -k 
change option 
/etc/sysctl.conf
sysctl -a | grep icmp


# boot section 
# boot sequence grub kernel initramfs systemd

systemctl poweroff
systemctl reboot 
systemctl hibernate 
echo b > /proc/sysrq-trigger # hard reset
# /etc/default/grup

systemd.unit = emergency.target
systemd.unit = rescue.target


# firewalls
# kernel firewall netfilter
iptables
firewalld # redhat
ufw # ubuntu

# zone is a collection of network cards 
# interfaces individual card
# services xml based configuration that specific what por opnened 
# forward ports,  using one por to other one
#masquerading, provides network address translation on a router
firewall-cmd 

firewall-cmd --list-all
firewall-cmd --add-service http --permanent
firewall-cmd --reload

# services definition in 
/usr/lib/firewalld/services 


sudo ufw enable
sudo ufw status
sudo ufw allow ssh
sudo ufw reject out ssh 
sudo ufw delete reject out ssh 
sudo ufw deny proto tcp from 10.0.0.10 to any port 22
sudo ufw reset
sudo ufw app list
sudo ufw app info Samba 
usdo ufw logging on  # start on start
man ufw

sudo iptables -L -v 

sudo ufw app info CUPS # show info app

iptables  -A OUTPUT -o ens33 -d ip -t tcp --dport 80 -j ACCEPT|REJECT|DROP|LOG 
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -m state --state=ESTABLISHED,RELATED -j ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT DROP


# to save

iptables-save to /etc/sysconfig/iptables
iptables -F INPUT to empty 

less /etc/passwd

SELinux locks down everything if it isn't allowed it is denied 
AppArmor works with profiles to secure specific services 

# armor 

/etc/apparmor.d
aa-genprof /your/application 
run application in another terminal
press s to scan for application events 

aa-status 

aa-enforce # change to enforce 

aa-enforce /path/app



apparmor_status
aa-complain
aa-enforce
aa-logprof messages that were generated and are not currently coverred by profile 
aa-notify 


selinux

/etc/sysconfig/selinux

getenforce
setenforce disabled


ps -Zaux
netstat -Ztulpen


# disk information  

lsblk 



fdisk /dev/....


cat /proc/partitions

parted 


ssd disk 

fstrim utility to trim ssd devices 

systemctl cat fstrim.service
systemctl cat fstrim.timer

vmstat 2 10
free -m # to monitor swats
grep ctive /proc/meminfo


cryptsetup luksFormat /dev/sdc3
cryptsetup luksOpen /dev/sdc3 secret 
mkfs.xfs /dev/mapper/secret 
mount /dev/mapper/secret /mnt

cp /etc/hosts /etc/passwd /mnt 

cryptsetup luksClose secret 

vi /etc/cryptab
vi /etc/fstab 



/etc/fstab mount

mount -a # apply changs 


blkid 
tune2fs

gdisk
pvcreate /dev/sdx
vgcreate vgname /dev/sdx 
lvcreate -n lvname -L1G vgname
mkds /dev/vgname/lvname 


lvs # list volumnes 
ld -h | grep lv # file system type 

lvreduce  -L -100M -r /dev/vgdata/lvext4

lvextend

partprobe # update partion table

vgextend vgdata /dev/sda6

vgs\\

lvcreate -i  stri[es]

lvcreate -m micrros 

#snapshots 
pvs
lvs
vgs 

lvextend
vgextend
lvreduce
pvdisplay 

pvcreate
vgcreate
lvcreate
lvcreate -s -n name -L 400M /dev/mapper/centos/...













