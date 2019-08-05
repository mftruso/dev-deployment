#! /bin/bash

. ./all.sh
echo Starting the docker world...

for dir in $PROJECTS; do
  pushd $dir > /dev/null;
  echo;
  echo "Publishing $dir";
  make release;
  popd > /dev/null;
done
