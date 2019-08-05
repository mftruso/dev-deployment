#! /bin/bash
echo Setting up Servant\' Code Development Environment:

./verify_prereqs.sh
if [ $? != 0 ]; then
  exit $?;
fi

. ./bin/all.sh
pushd .. > /dev/null;

git clone git@github.com:servantscode/java-commons.git
git clone git@github.com:servantscode/docker-elk.git
git clone git@github.com:servantscode/tomcat-elk-logging.git
git clone git@github.com:servantscode/fake-data.git

echo Pulling Servant\'s Code repos: $PROJECTS

for dir in $PROJECTS; do
  echo;
  echo "Cloning $dir";
  git clone git@github.com:servantscode/$dir.git
done

cp dev-deployment/bin/*.sh .
./build_all.sh

echo;
echo Starting elk stack;
pushd docker-elk > /dev/null;
make run;
popd > /dev/null;

./start_all.sh

popd > /dev/null;

./deploy-configmaps.sh
./deploy-ingress.sh

echo;
echo Servant's Code development setup complete!!
