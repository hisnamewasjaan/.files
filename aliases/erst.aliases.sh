#!/usr/bin/env bash

# sit vpn
alias vpnsecret='cat ~/.sit/password.txt'
alias vpntotp='totp get sitvpn'
alias sitvpn='sudo /usr/local/sbin/openconnect ext2.statens-it.dk -b --local-id=device_uniqueid=$(cat ~/.sit/udid.txt) -u X020997'


alias sag='cd ~/dev/erst/sag'


# mount samba share - with keychain access
alias logsnine='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-nine\"" -e "end try"'
alias logsall='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-all\"" -e "end try"'
alias logsarchived='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-all/operations/archived-logs\"" -e "end try"'
alias smbpogo='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/pogo\"" -e "end try"'
alias smbsagslager='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/sagslager\"" -e "end try"'
alias smbkompensation='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/kompensationsmodul\"" -e "end try"'
alias smbbetalingsoverblik='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/betalingsoverblik\"" -e "end try"'

alias nin_jbe@dev.erst.dk='security find-internet-password -a nin_jbe -s dev.erst.dk -g'
alias nin_jbe@dev.erst.dk='security find-internet-password -a nin_jbe -g'


alias komp_erduoppe_overblik='http https://erst.virk.dk/kompensationsmodul/erduoppe/overblik'
alias komp_erduoppe_overblik_p05="http 'https://erst.virk.dk/kompensationsmodul/erduoppe/overblik?jsessionid=.kompensationsmodul-es-s-app-p05'"
alias komp_erduoppe_overblik_p06="http 'https://erst.virk.dk/kompensationsmodul/erduoppe/overblik?jsessionid=.kompensationsmodul-es-s-app-p06'"

alias komp_erduoppe_false="http https://erst.virk.dk/kompensationsmodul/erduoppe/overblik | json_pp | rg 'available\" : false' -A6"

alias flogerror="rgl '] ERROR (?!.*(Klientinformation))' prod-app-p06/kompensationsmodul.log -A 30"


# gitlab cli: https://gitlab.com/gitlab-org/cli
# clone every repo in a group/project
alias klon_kerne='glab repo clone --group kerne --paginate'

alias ssh_dokumentlager_dev='ssh erst-infd-app01'
alias ssh_sagslager_dev='ssh erst-infd-app03'
alias ssh_simpelregistrering_dev='ssh erst-infd-app03'
alias ssh_sagsstyring_dev='ssh erst-infd-app03'
alias ssh_sagsindeks_dev='ssh erst-infd-app05'
