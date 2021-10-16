# Clear firewall rules 
netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

# DNS
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp remoteport=53 dir=out 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp localport=53 dir=out 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp remoteport=53 dir=in 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp localport=53 dir=in 

# AD Services
netsh advfirewall firewall add rule name="AD1-tcp-in" action=allow protocol=tcp remoteport=389,445,88,135,3268 dir=in remoteip=10.5.1.60
netsh advfirewall firewall add rule name="AD1-udp-in" action=allow protocol=udp remoteport=389,445,88,135,123 dir=in remoteip=10.5.1.60
netsh advfirewall firewall add rule name="AD1-tcp-out" action=allow protocol=tcp remoteport=389,445,88,135,3268 dir=out remoteip=10.5.1.60
netsh advfirewall firewall add rule name="AD1-udp-out" action=allow protocol=udp remoteport=389,445,88,135,123 dir=out remoteip=10.5.1.60

# RDP - so it can be reached from AD server
netsh advfirewall firewall add rule name="RDP-in" dir=in protocol=tcp localport=3389 action=allow remoteip=10.5.1.60
netsh advfirewall firewall add rule name="RDP-out" dir=out protocol=tcp localport=3389 action=allow

# FTP (yuck)
netsh advfirewall firewall add rule name="FTP-data" dir=in protocol=tcp localport=20 action=allow
netsh advfirewall firewall add rule name="FTP-command" dir=in protocol=tcp localport=21 action=allow

netsh advfirewall set allprofiles logging filename $HOME\Desktop\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles logging allowedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable