#!/usr/bin/env bash

kodestandard() {
    local tmpdir
    tmpdir=/tmp/$(uuidgen) &&
    mkdir "$tmpdir" &&
    echo "$tmpdir" &&
    ([[ -n "$@" ]] &&
    # clone specific branch if specified in arguments:
    git clone git@rep.erst.dk:sector9/sector9-kodestandard.git "$tmpdir" --depth=1 --quiet --branch "$@" ||
    # otherwise clone default branch:
    git clone git@rep.erst.dk:sector9/sector9-kodestandard.git "$tmpdir" --depth=1 --quiet) &&
    cp -r "$tmpdir/gradle-templates/"* gradle &&
    cp "$tmpdir/.editorconfig" .
    cp "$tmpdir/sonar-project.properties" .
}
