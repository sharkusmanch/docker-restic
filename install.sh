#!/bin/bash

set -e

OS_type="$(uname -m)"
case "$OS_type" in
  x86_64|amd64)
    OS_type='amd64'
    ;;
  aarch64|arm64)
    OS_type='arm64'
    ;;
  arm*)
    OS_type='arm'
    ;;
  *)
    echo 'OS type not supported'
    exit 2
    ;;
esac

echo curl -L https://github.com/restic/restic/releases/download/v$VERSION/restic_"$VERSION"_linux_$OS_type.bz2 --output restic.bz2
curl -L https://github.com/restic/restic/releases/download/v$VERSION/restic_"$VERSION"_linux_$OS_type.bz2 --output restic.bz2
bzip2 -d restic.bz2
mv restic /usr/bin/
chmod ugo+x /usr/bin/restic