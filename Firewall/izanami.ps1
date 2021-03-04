netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

# ICMP
netsh advfirewall firewall add rule name="ICMP" dir=in action=allow protocol=icmpv4:8,any
netsh advfirewall firewall add rule name="ICMP" dir=out action=allow protocol=icmpv4:8,any

# DNS
netsh advfirewall firewall add rule name="DNS" dir=out action=allow protocol=udp localport=53 remoteport=53 enable=yes profile=any action=allow
netsh advfirewall firewall add rule name="DNS" dir=in action=allow protocol=udp localport=53 remoteport=53 enable=yes profile=any action=allow

# AD Services
netsh advfirewall firewall add rule name="AD-tcp-in" action=allow protocol=tcp localport=389,445,88,135,3268 dir=in 
netsh advfirewall firewall add rule name="AD-udp-in" action=allow protocol=udp localport=389,445,88,135,123 dir=in 
netsh advfirewall firewall add rule name="AD-tcp-out" action=allow protocol=tcp localport=389,445,88,135,3268 dir=out
netsh advfirewall firewall add rule name="AD-udp-out" action=allow protocol=udp localport=389,445,88,135,123 dir=out

netsh advfirewall firewall add rule name="IIS Remote Management" dir=out action=allow protocol=TCP remoteport=8172

# WinRM to reach remote?

# RDP to reach remote? 

netsh advfirewall set allprofiles logging filename $HOME\Desktop\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable 
netsh advfirewall set allprofiles settings inboundusernotification enable