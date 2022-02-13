#!/usr/bin/env bash

function vpnup() {
    if [ -f "$HOME/.openconnect.pid" ]; then
        echo "openconnect pid file already exists, probably running"
    else
        sudo /bin/stty -tostop && \
        echo -e "$(cat ~/.sit/password.txt)\n$(cat ~/.sit/totp-secret.txt | xargs oathtool --totp -b)" | sudo /usr/local/sbin/openconnect ext2.statens-it.dk -b --pid-file="$HOME/.openconnect.pid" --local-id=device_uniqueid=$(cat ~/.sit/udid.txt) -u X020997 --passwd-on-stdin
    fi
}
#--reconnect-timeout

function vpnstop() {
    if [ -f "$HOME/.openconnect.pid" ]; then
        sudo kill -2 $(cat "$HOME/.openconnect.pid") && sudo rm -f "$HOME/.openconnect.pid"
    else
        echo "openconnect pid file does not exist, probably not running"
    fi
}

function vpnchallenge() {

    echo -e "$(cat ~/.sit/password.txt)\n$(cat ~/.sit/totp-secret.txt | xargs oathtool --totp -b)" | sudo /usr/local/sbin/openconnect ext2.statens-it.dk -b --pid-file="$HOME/.openconnect.pid" --local-id=device_uniqueid=$(cat ~/.sit/udid.txt) -u X020997 --passwd-on-stdin
}
