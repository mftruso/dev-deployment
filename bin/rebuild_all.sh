#! /bin/bash
echo Starting...

. ./all.sh
echo Rebuilding the docker world: $PROJECTS

for dir in $PROJECTS; do
  pushd $dir > /dev/null;
  echo;
  echo "Starting $dir";
  if [ -f build.gradle ]; then
    gradle war;
  fi
  make build;
  make update;
  popd > /dev/null;
done
