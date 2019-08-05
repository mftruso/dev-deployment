#! /bin/bash
echo Starting...

. ./all.sh
echo Rebuilding the docker world: $PROJECTS

echo;
echo "Building java-commons";
pushd java-commons > /dev/null;
gradle install;
popd > /dev/null;

echo;
echo "Building tomcat-elk-logging";
pushd tomcat-elk-logging > /dev/null;
make build;
popd > /dev/null;

for dir in $PROJECTS; do
  pushd $dir > /dev/null;
  echo;
  echo "Starting $dir";
  if [ -f build.gradle ]; then
    gradle war;
  fi
  make build;
  popd > /dev/null;
done
