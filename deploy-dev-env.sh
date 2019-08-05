#! /bin/bash
echo Setting up Servant\' Code Development Environment:

echo;
echo Checking Docker version:
docker.exe version
if [ $? != 0 ]; then
  echo Docker not found!! Please verify Docker installation before continuing...;
  exit 1;
fi

echo;
echo Checking Kubernetes version:
kubectl.exe version
if [ $? != 0 ]; then
  echo Kubectl not found!! Please verify Kubernetes installation before continuing...;
  exit 1;
fi

pushd .. > /dev/null;

git clone git@github.com:servantscode/java-commons.git
git clone git@github.com:servantscode/docker-elk.git
git clone git@github.com:servantscode/tomcat-elk-logging.git

. ./all.sh
echo Pulling Servant\'s Code repos: $PROJECTS

for dir in $PROJECTS; do
  echo;
  echo "Cloning $dir";
  git clone git@github.com:servantscode/$dir.git
done

cp dev-deployment/bin/*.sh .
./rebuild_all.sh

echo;
echo Servant's Code development setup complete!!
popd
