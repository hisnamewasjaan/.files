#!/usr/bin/env bash

function gr2() {
	j7
	./grailsw clean-all
	./grailsw compile
	./grailsw test-app -unit
}

# gradle wrapper run single unit spec by name
function gwt() {
  ./gradlew test --tests *$1
}

# gradle wrapper run single integration spec by name
function gwit() {
  ./gradlew iT --tests *$1
}
