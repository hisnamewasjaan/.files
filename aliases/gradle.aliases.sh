#!/usr/bin/env bash

# grails clean, compile, test
alias gct='./grailsw clean-all && ./grailsw compile && ./grailsw test-app'
alias gcr='./grailsw clean-all && ./grailsw compile && ./grailsw run-app'

# run gradle wrapper verbose
alias gw="./gradlew --console=verbose"

# gradle clean, check
alias gcc='./gradlew clean check'
alias gccc='./gradlew clean check -DENABLE_CLOVER=true'
alias gcccg='./gradlew clean check -DENABLE_CLOVER=true -Dtest.enableGebTest=true'
alias gctc='./gradlew clean test codenarcAll'
alias gt='./gradlew test'

alias gr5="./gradlew -g ~/.gradle5 --console verbose"
alias gr5k='gr5 -PtestloggerQuiet=true'
