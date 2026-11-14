#!/usr/bin/env bash

# list docker sandboxes
alias sbxls='sbx ls'

# stop all running docker sandboxes
alias sbxstop='sbx stop $(sbx ls -q)'

# remove all stopped docker sandboxes
alias sbxprune='sbx prune'

# open a shell in the docker sandbox for the current dir
alias sbxshell='sbx run shell'
