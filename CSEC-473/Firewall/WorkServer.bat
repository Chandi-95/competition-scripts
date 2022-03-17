:: Delete all rules
netsh advfirewall set allprofiles state off
netsh advfirewall set allprofiles firewallpolicy allowinbound,allowoutbound
netsh advfirewall firewall delete rule name=all

:: Configure logging
netsh advfirewall set allprofiles logging filename C:\Windows\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles logging allowedconnections enable

:: HTTP(S) Client (to access web)
netsh adv f a r n=HTTP-Client dir=out act=allow prof=any prot=tcp remoteport=80,443

:: DNS
netsh adv f a r n=DNS-Client dir=out act=allow prof=any prot=udp remoteport=53

:: AD Services 
netsh adv f a r n=DC-TCP-In dir=in act=allow prof=any prot=tcp remoteport=88,135,389,445,636,3268
netsh adv f a r n=DC-UDP-In dir=in act=allow prof=any prot=udp remoteport=88,123,135,389,445,636
netsh adv f a r n=DC-TCP-Out dir=out act=allow prof=any prot=tcp remoteport=88,135,389,445,636,3268
netsh adv f a r n=DC-UDP-Out dir=out act=allow prof=any prot=udp remoteport=88,123,135,389,445,636

:: SMB
netsh adv f a r n=SMB-Server-In dir=in act=allow prof=any prot=tcp localport=445
netsh adv f a r n=SMB-Server-Out dir=out act=allow prof=any prot=tcp localport=445

:: Turn on firewall and default block
netsh advfirewall set allprofiles state on
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

:: Lockout prevention
timeout 60
netsh advfirewall set allprofiles state off