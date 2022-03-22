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
netsh adv f a r n=DNS-Server dir=in act=allow prof=any prot=udp localport=53

:: AD Services 
netsh adv f a r n=DC-TCP-In dir=in act=allow prof=any prot=tcp localport=88,135,389,445,636,3268
netsh adv f a r n=DC-UDP-In dir=in act=allow prof=any prot=udp localport=88,123,135,389,445,636
netsh adv f a r n=DC-TCP-Out dir=out act=allow prof=any prot=tcp localport=88,135,389,445,636,3268
netsh adv f a r n=DC-UDP-Out dir=out act=allow prof=any prot=udp localport=88,123,135,389,445,636

:: SSH Client - to reach cloud
netsh adv f a r n=SSH-Client dir=out act=allow prof=any prot=tcp remoteport=22

:: WinRM Client - to reach cloud
netsh adv f a r n=WinRM-Client dir=out act=allow prof=any prot=tcp remoteport=5985,5986

:: RDP Client - to reach cloud
netsh adv f a r n=RDP-TCP-Client dir=out act=allow prof=any prot=tcp remoteport=3389 
netsh adv f a r n=RDP-UDP-Client dir=out act=allow prof=any prot=udp remoteport=3389 

:: Turn on firewall and default block
netsh advfirewall set allprofiles state on
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

:: Lockout prevention
timeout 60
netsh advfirewall set allprofiles state off