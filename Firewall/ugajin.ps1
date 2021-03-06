netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

# ICMP
netsh advfirewall firewall add rule name="ICMP" dir=in action=allow protocol=icmpv4:8,any
netsh advfirewall firewall add rule name="ICMP" dir=out action=allow protocol=icmpv4:8,any

# DNS
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp remoteport=53 dir=out 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp localport=53 dir=out 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp remoteport=53 dir=in 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp localport=53 dir=in 

# AD Services - Izanagi
netsh advfirewall firewall add rule name="AD1-tcp-in" action=allow protocol=tcp remoteport=389,445,88,135,3268 dir=in remoteip=10.2.1.1
netsh advfirewall firewall add rule name="AD1-udp-in" action=allow protocol=udp remoteport=389,445,88,135,123 dir=in remoteip=10.2.1.1
netsh advfirewall firewall add rule name="AD1-tcp-out" action=allow protocol=tcp remoteport=389,445,88,135,3268 dir=out remoteip=10.2.1.1
netsh advfirewall firewall add rule name="AD1-udp-out" action=allow protocol=udp remoteport=389,445,88,135,123 dir=out remoteip=10.2.1.1

# AD Services - Izanami
netsh advfirewall firewall add rule name="AD2-tcp-in" action=allow protocol=tcp remoteport=389,445,88,135,3268 dir=in remoteip=10.2.1.2
netsh advfirewall firewall add rule name="AD2-udp-in" action=allow protocol=udp remoteport=389,445,88,135,123 dir=in remoteip=10.2.1.2
netsh advfirewall firewall add rule name="AD2-tcp-out" action=allow protocol=tcp remoteport=389,445,88,135,3268 dir=out remoteip=10.2.1.2
netsh advfirewall firewall add rule name="AD2-udp-out" action=allow protocol=udp remoteport=389,445,88,135,123 dir=out remoteip=10.2.1.2

# WinRM - scoring check
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-In)" dir=in protocol=tcp localport=5985 action=allow remoteip=172.16.128.0/17 
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-out)" dir=out protocol=tcp localport=5985 action=allow remoteip=172.16.128.0/17 

# WinRM - outbound to cloud 
netsh advfirewall firewall add rule name="Windows Remote Management - Cloud (HTTP-In)" dir=in protocol=tcp remoteport=5985 action=allow
netsh advfirewall firewall add rule name="Windows Remote Management - Cloud (HTTP-out)" dir=out protocol=tcp remoteport=5985 action=allow 

# RDP - to reach remote
netsh advfirewall firewall add rule name="RDP" dir=in protocol=tcp remoteport=3389 action=allow remoteip=172.16.2.21
netsh advfirewall firewall add rule name="RDP" dir=out protocol=tcp remoteport=3389 action=allow remoteip=172.16.2.21

netsh advfirewall set allprofiles logging filename $HOME\Desktop\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles logging allowedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable
