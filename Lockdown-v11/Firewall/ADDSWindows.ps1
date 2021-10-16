# Clear firewall rules 
netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

# ICMP - just for testing, pls kill later
netsh advfirewall firewall add rule name="ICMP" dir=in action=allow protocol=icmpv4:8,any
netsh advfirewall firewall add rule name="ICMP" dir=out action=allow protocol=icmpv4:8,any

# DNS - udp for queries, add tcp for zone transfers
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp remoteport=53 dir=out 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp localport=53 dir=out 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp remoteport=53 dir=in 
netsh advfirewall firewall add rule name="DNS" action=allow protocol=udp localport=53 dir=in 

# AD Services
netsh advfirewall firewall add rule name="AD-tcp-in" action=allow protocol=tcp localport=389,445,88,135,3268 dir=in 
netsh advfirewall firewall add rule name="AD-udp-in" action=allow protocol=udp localport=389,445,88,135,123 dir=in 
netsh advfirewall firewall add rule name="AD-tcp-out" action=allow protocol=tcp localport=389,445,88,135,3268 dir=out
netsh advfirewall firewall add rule name="AD-udp-out" action=allow protocol=udp localport=389,445,88,135,123 dir=out

# RDP - to reach remote 
netsh advfirewall firewall add rule name="RDP" dir=in protocol=tcp remoteport=3389 action=allow remoteip=10.5.2.4
netsh advfirewall firewall add rule name="RDP" dir=out protocol=tcp remoteport=3389 action=allow remoteip=10.5.2.4

# Logging settings
netsh advfirewall set allprofiles logging filename $HOME\Desktop\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable 
netsh advfirewall set allprofiles settings inboundusernotification enable
