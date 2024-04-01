#!/usr/bin/env bash

function vpnup() {
    readonly vpnhost=${1:-"ext3"}

    if [ -f "$HOME/.openconnect.pid" ]; then
        echo "openconnect pid file already exists, probably running"
    else
        sudo /bin/stty -tostop && \
        echo -e "$(sudo cat ~/.sit/password.txt)\n$(totp get sitvpn)" | \
          sudo /usr/local/sbin/openconnect "${vpnhost}".statens-it.dk \
            -b \
            --pid-file="$HOME/.openconnect.pid" \
            --local-id=device_uniqueid="$(cat ~/.sit/udid.txt)" \
            -u X020997 \
            --passwd-on-stdin
    fi
}

function vpndown() {
    if [ -f "$HOME/.openconnect.pid" ]; then
        sudo kill -2 "$(cat "$HOME"/.openconnect.pid)" && sudo rm -f "$HOME/.openconnect.pid"
    else
        echo "openconnect pid file does not exist, probably not running"
    fi
}
