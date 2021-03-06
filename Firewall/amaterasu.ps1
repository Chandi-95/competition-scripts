netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

# ICMP
netsh advfirewall firewall add rule name="ICMP" dir=in action=allow protocol=icmpv4:8,any
netsh advfirewall firewall add rule name="ICMP" dir=out action=allow protocol=icmpv4:8,any

# DNS
netsh advfirewall firewall add rule name="DNS" dir=out protocol=udp localport=53 remoteport=53 action=allow
netsh advfirewall firewall add rule name="DNS" dir=in protocol=udp localport=53 remoteport=53 action=allow

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

# Mail Service Ports
netsh advfirewall firewall add rule name="SMTP" dir=in protocol=tcp localport=25 action=allow
netsh advfirewall firewall add rule name="SMTP" dir=out protocol=tcp localport=25 action=allow

netsh advfirewall firewall add rule name="Submission" dir=in protocol=tcp localport=587 action=allow
netsh advfirewall firewall add rule name="Submission" dir=out protocol=tcp localport=587 action=allow

netsh advfirewall firewall add rule name="POP3" dir=in protocol=tcp localport=110 action=allow
netsh advfirewall firewall add rule name="POP3" dir=out protocol=tcp localport=110 action=allow

netsh advfirewall firewall add rule name="IMAP" dir=in protocol=tcp localport=143 action=allow
netsh advfirewall firewall add rule name="IMAP" dir=out protocol=tcp localport=143 action=allow

# Some more sick rules for managing hMailServer remotely

# MariaDB - port 3306 to the database server
netsh advfirewall firewall add rule name="DB-in" dir=in protocol=tcp remoteport=3306 action=allow
netsh advfirewall firewall add rule name="DB-out" dir=out protocol=tcp remoteport=3306 action=allow

# WinRM - so it can be reached from DC server
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-In)" dir=in protocol=tcp localport=5985 action=allow remoteip=10.2.1.2 
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-out)" dir=out protocol=tcp localport=5985 action=allow remoteip=10.2.1.2

# RDP - so it can be reached from DC server
netsh advfirewall firewall add rule name="RDP-in" dir=in protocol=tcp localport=3389 action=allow remoteip=10.2.1.2
netsh advfirewall firewall add rule name="RDP-out" dir=out protocol=tcp localport=3389 action=allow

netsh advfirewall set allprofiles logging filename $HOME\Desktop\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles logging allowedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable
