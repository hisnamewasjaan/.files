#!/usr/bin/env bash

# mount samba share - with keychain access
alias logsnine='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-nine\"" -e "end try"'
alias logsall='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-all\"" -e "end try"'
alias logsarchived='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/logs-all/operations/archived-logs\"" -e "end try"'
alias smbsagslager='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/sagslager\"" -e "end try"'
alias smbbetalingsoverblik='/usr/bin/osascript -e "try" -e "mount volume \"smb://smb_ni_jbe@samba.nonprod.es.local/betalingsoverblik\"" -e "end try"'

alias nin_jbe@dev.erst.dk='security find-internet-password -a nin_jbe -s dev.erst.dk -g'
alias nin_jbe@dev.erst.dk='security find-internet-password -a nin_jbe -g'


# gitlab cli: https://gitlab.com/gitlab-org/cli
# clone every repo in a group/project

alias ssh_dokumentlager_dev='ssh erst-infd-app01'
alias ssh_sagslager_dev='ssh erst-infd-app03'
alias ssh_sagsindeks_dev='ssh erst-infd-app05'
