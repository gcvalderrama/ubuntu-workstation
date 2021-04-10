

## port services 
sudo cat /etc/services | grep 21


## install firewalld

sudo apt install firewalld


$ sudo firewall-cmd --zone=home --list-ports


$ sudo firewall-cmd --zone=home --add-port=21/tcp


$ sudo firewall-cmd --list-services --zone=public

$ sudo firewall-cmd --get-services


Get the default zone:

$ sudo firewall-cmd --get-default-zone
public

Obtain a list of zones currently being used:

$ sudo firewall-cmd --get-active-zones
public
interfaces: eno16777736

List all available zones:

$ sudo firewall-cmd --get-zones
block dmz drop external home internal public trusted work

To change the default zone to trusted and then change it back!

$ sudo firewall-cmd --set-default-zone=trusted
success

$ sudo firewall-cmd --set-default-zone=public
success

To assign an interface temporarily to a particular zone:

$ sudo firewall-cmd --zone=internal --change-interface=eno1
success

To assign an interface to a particular zone permanently:

$ sudo firewall-cmd --permanent --zone=internal --change-interface=eno1
success

which creates the file /etc/firewalld/zones/internal.xml.

To ascertain the zone associated with a particular interface:

$ sudo firewall-cmd --get-zone-of-interface=eno1
public

Finally, to get all details about a particular zone:

$ sudo firewall-cmd --zone=public --list-all
public (default, active)
interfaces: eno16777736
sources:
services: dhcpv6-client ssh
ports:
masquerade: no
forward-ports:
icmp-blocks:
rich rules:

Controlling firewalld is done through the firewall-cmd program. More detailed information can be obtained with:

man firewalld-cmd



$ sudo shutdown -r now

$ sudo shutdown -h now


# system d

$ systemctl

To show all available services:

$ systemctl list-units -t service --all

To show only active services:

$ systemctl list-units -t service

To start (activate) or stop (deactivate) one or more units:

$ sudo systemctl start foo
$ sudo systemctl start foo.service
$ sudo systemctl start /path/to/foo.service
$ sudo systemctl stop foo.service

where a unit can be a service or a socket.

To enable/disable a service:

$ sudo systemctl enable sshd.service
$ sudo systemctl disable sshd.service



(/var/log/messages, /var/log/secure, etc.)

IP Configuration

Use ifconfig or ip to see if the interface is up, and if so, if it is configured.

Network Driver

If the interface can't be brought up, maybe the correct device driver for the network card(s) is not loaded. Check with lsmod if the network driver is loaded as a kernel module, or by examining relevant pseudo-files in 
/proc and /sys, such as /proc/interrupts or /sys/class/net.


Use ping to see if the network is visible, checking for response time and packet loss. 
traceroute can follow packets through the network, 
while mtr can do this in a continuous fashion.
Use of these utilities can tell you if the problem is local or on the Internet.

Default Gateway and Routing Configuration

Run route -n and see if the routing table makes sense.

Hostname Resolution

Run dig or host on a URL and see if DNS is working properly.


 ps -elf

 