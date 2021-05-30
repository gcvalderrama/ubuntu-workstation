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


