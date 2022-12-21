#!/usr/bin/env bash

# sit vpn
alias vpnsecret='cat ~/.sit/password.txt'
alias vpntotp='cat ~/.sit/totp-secret.txt | xargs oathtool --totp -b'
alias sitvpn='sudo /usr/local/sbin/openconnect ext2.statens-it.dk -b --local-id=device_uniqueid=$(cat ~/.sit/udid.txt) -u X020997'


alias sag='cd ~/dev/erst/sag'
alias kogt='cd ~/dev/erst/kogt'
alias pogo='cd ~/dev/erst/pogo'

alias kogtlocal='open -a /Applications/Firefox.app/  http://localhost:16391/kontrologtilsyn/'
alias pogolocal='open -a /Applications/Firefox.app/  http://localhost:20001/pogo-webservices/'

# mount samba share - with keychain access
alias logsnine='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-nine\"" -e "end try"'
alias logsall='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-all\"" -e "end try"'
alias logsarchived='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-all/operations/archived-logs\"" -e "end try"'
alias smbpogo='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/pogo\"" -e "end try"'
alias smbsagslager='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/sagslager\"" -e "end try"'
alias smbkompensation='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/kompensationsmodul\"" -e "end try"'

alias nin_jbe@dev.erst.dk='security find-internet-password -a nin_jbe -s dev.erst.dk -g'
alias nin_jbe@dev.erst.dk='security find-internet-password -a nin_jbe -g'


alias komp_erduoppe_overblik='http https://erst.virk.dk/kompensationsmodul/erduoppe/overblik'
alias komp_erduoppe_overblik_p05="http 'https://erst.virk.dk/kompensationsmodul/erduoppe/overblik?jsessionid=.kompensationsmodul-es-s-app-p05'"
alias komp_erduoppe_overblik_p06="http 'https://erst.virk.dk/kompensationsmodul/erduoppe/overblik?jsessionid=.kompensationsmodul-es-s-app-p06'"

alias komp_erduoppe_false="http https://erst.virk.dk/kompensationsmodul/erduoppe/overblik | json_pp | rg 'available\" : false' -A6"
