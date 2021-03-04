netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

# IIS - change local port for HTTP based on website bindings
netsh advfirewall firewall add rule name="HTTP-in" dir=in protocol=tcp localport=8083 action=allow
netsh advfirewall firewall add rule name="HTTP-out" dir=out protocol=tcp localport=8083 action=allow
netsh advfirewall firewall add rule name="IIS Remote Management" dir=in action=allow protocol=TCP localport=8172

# WinRM
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-In)" dir=in protocol=tcp localport=5985 remoteip=$scoringip action=allow
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-out)" dir=out protocol=tcp localport=5985 remoteip=$scoringip action=allow

# RDP?


# DNS
netsh advfirewall firewall add rule name="DNS" dir=out action=allow protocol=udp localport=53 remoteport=53 enable=yes profile=any action=allow
netsh advfirewall firewall add rule name="DNS" dir=in action=allow protocol=udp localport=53 remoteport=53 enable=yes profile=any action=allow

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

netsh advfirewall set allprofiles logging filename $HOME\Desktop\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles logging allowedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable
