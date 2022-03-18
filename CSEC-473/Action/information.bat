@echo off

call :sub >output.txt
exit /b

:sub
:: Listing basic inventory
echo Hostname:
hostname
echo:
echo Ipconfig:
ipconfig /all
echo:
echo Operating System:
systeminfo | findstr OS

:: Checking for listening ports
echo:
echo Listening Ports:
netstat -ano | findstr LIST | findstr /V ::1 | findstr /V 127.0.0.1

:: Listing users and groups
echo:
echo Users:
net user
echo:
echo Groups:
net localgroup
echo:
echo Administrators Users:
net localgroup "Administrators"
echo:
echo Remote Desktop Users:
net localgroup "Remote Desktop Users"
echo:
echo Remote Management Users:
net localgroup "Remote Management Users"

:: Looking for network shares
echo:
echo Network Shares:
net share

:: Checking scheduled tasks (idk if it shows hidden)
echo: 
echo Scheduled Tasks:
schtasks /query /fo LIST /v

:: Check startup programs
echo:
echo Startup Programs:
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"

:: Check password filters
echo:
echo Password Filters:
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "Notification Packages"

:: Check custom DLLs
echo:
echo AppInit_DLLs:
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v AppInit_DLLs

:: Check for Custom DLLs in Winlogon
echo:
echo Winlogon DLLs:
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Notify

:: Check for unsigned files (run this in the same directory as sigcheck!)
echo:
echo Signed/Unsigned Files:
sigcheck64 -u -e c:\windows\system32