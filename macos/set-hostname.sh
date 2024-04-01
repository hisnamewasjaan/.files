#!/bin/zsh
echo 'Current ComputerName <'$(sudo scutil --get ComputerName)'>'
echo 'Current HostName <'$(sudo scutil --get HostName)'>'
echo 'Current LocalHostName <'$(sudo scutil --get LocalHostName)'>'
echo 'Current NetBIOSName <'$(sudo defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName)'>'

vared -p 'hostname? ' -c newhostname
vared -p 'localhostname? ' -c newlocalhostname

echo 'Setting hostname <'$newhostname'>'
echo 'Setting localhostname <'$newlocalhostname'>'

sudo scutil --set ComputerName $newhostname && \
sudo scutil --set HostName $newhostname && \
sudo scutil --set LocalHostName $newlocalhostname && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $newhostname

dscacheutil -flushcache
