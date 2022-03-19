# Grabbing other scripts because am lazy
(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/Chandi-95/competition-scripts/main/CSEC-473/Action/5minsecure.bat", "$HOME\Music\5min.bat")
(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/Chandi-95/competition-scripts/main/CSEC-473/Action/information.bat", "$HOME\Music\info.bat")

# Sysinternals
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/Autoruns.zip", "$HOME\Music\ar.zip")
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/TCPView.zip", "$HOME\Music\tv.zip")
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/Sysmon.zip", "$HOME\Music\sm.zip")
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/ProcessExplorer.zip", "$HOME\Music\pe.zip")
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/ProcessMonitor.zip", "$HOME\Music\pm.zip")
(New-Object System.Net.WebClient).DownloadFile("https://download.sysinternals.com/files/Sigcheck.zip", "$HOME\Music\sc.zip")

# Windows Firewall Control
(New-Object System.Net.WebClient).DownloadFile("https://www.binisoft.org/download/wfc6setup.exe", "$HOME\Music\wfwcsetup.exe")
# Wireshark
(New-Object System.Net.WebClient).DownloadFile("https://1.na.dl.wireshark.org/win64/Wireshark-win64-latest.exe", "$HOME\Music\wsinstall.exe")
# Chrome
(New-Object System.Net.WebClient).DownloadFile("http://dl.google.com/chrome/install/375.126/chrome_installer.exe", "$HOME\Music\chromeinstall.exe")

# Explorer++
# (New-Object System.Net.WebClient).DownloadFile(“https://explorerplusplus.com/software/explorer++_1.3.5_x64.zip”, “C:\explorerplusplus.zip”)
# Expand-Archive -LiteralPath C:\explorerplusplus.zip -DestinationPath C:\explorerplusplus

# Basic Sysmon config file
(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/olafhartong/sysmon-modular/master/sysmonconfig.xml", "$HOME\Music\sysmonconfig.xml")

# Unzipping stuff
Expand-Archive -LiteralPath "$HOME\Music\ar.zip" -DestinationPath "$HOME\Music\ar"
Expand-Archive -LiteralPath "$HOME\Music\tv.zip" -DestinationPath "$HOME\Music\tv"
Expand-Archive -LiteralPath "$HOME\Music\sm.zip" -DestinationPath "$HOME\Music\sm"
Expand-Archive -LiteralPath "$HOME\Music\pe.zip" -DestinationPath "$HOME\Music\pe"
Expand-Archive -LiteralPath "$HOME\Music\pm.zip" -DestinationPath "$HOME\Music\pm"
Expand-Archive -LiteralPath "$HOME\Music\sc.zip" -DestinationPath "$HOME\Music\sc"