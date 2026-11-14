#!/usr/bin/env bash

# grails clean, compile, test
alias gct='./grailsw clean-all && ./grailsw compile && ./grailsw test-app'
alias gcr='./grailsw clean-all && ./grailsw compile && ./grailsw run-app'

# run gradle wrapper verbose
alias gw="./gradlew --console=verbose"
alias gw3="./gradlew -g ~/.gradle-grails3"
