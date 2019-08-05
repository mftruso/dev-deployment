#! /bin/bash
echo Starting...

. ./all.sh
echo Rebuilding the docker world: $PROJECTS

for dir in $PROJECTS; do
  pushd $dir > /dev/null;
  echo;
  echo "pulling $dir";
  git pull
  popd > /dev/null;
done
