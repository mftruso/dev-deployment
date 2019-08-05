#! /bin/bash

. ./all.sh
echo Starting the docker world...

for dir in $PROJECTS; do
  pushd $dir > /dev/null;
  echo;
  echo "Starting $dir";
  make run;
  popd > /dev/null;
done
