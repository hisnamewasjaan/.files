#!/usr/bin/env bash

kodestandard() {
    local tmpdir
    tmpdir=/tmp/$(uuidgen) &&
    mkdir "$tmpdir" &&
    echo "$tmpdir" &&
    ([[ -n "$1" ]] &&
    # clone specific branch if specified in arguments:
    git clone git@rep.erst.dk:kerneb/kerneb-kodestandard.git "$tmpdir" --depth=1 --quiet --branch "$1" ||
    # otherwise clone default branch:
    git clone git@rep.erst.dk:kerneb/kerneb-kodestandard.git "$tmpdir" --depth=1 --quiet) &&
    cp -r "$tmpdir/gradle-templates/"* gradle &&
    cp "$tmpdir/.editorconfig" .
    cp "$tmpdir/sonar-project.properties" .
}
