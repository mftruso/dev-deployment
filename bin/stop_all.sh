#! /bin/bash

. ./all.sh
echo Starting the docker world...

for dir in $PROJECTS; do
  pushd $dir > /dev/null;
  echo;
  echo "Stopping $dir";
  make stop;
  popd > /dev/null;
done
