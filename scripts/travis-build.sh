#!/bin/bash

set -euo pipefail

ENV=development

if [[ ! -z "${RUNDECK_TAG:-}" ]] ; then
    ENV=release
fi

./gradlew -Penvironment="${ENV}" -x check install

groovy testbuild.groovy --buildType="${ENV}"

make ENV="${ENV}" rpm deb