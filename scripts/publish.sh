#! /usr/bin/env bash

set -e

registry="registry.gitlab.com/var-app/code"

here=$(dirname $0)
root=$(readlink -f "$here/..")

$here/build.sh

skopeo copy \
       "oci-archive://$root/build/build.oci" \
       "docker://$registry/build-jammy-varapp"

skopeo copy \
       "oci-archive://$root/build/run.oci" \
       "docker://$registry/run-jammy-varapp"
