#!/usr/bin/env bash

# sit vpn
alias vpnsecret='cat ~/.sit/password.txt'
alias vpntotp='cat ~/.sit/totp-secret.txt | xargs oathtool --totp -b'
alias sitvpn='sudo /usr/local/sbin/openconnect ext2.statens-it.dk -b --local-id=device_uniqueid=$(cat ~/.sit/udid.txt) -u X020997'
