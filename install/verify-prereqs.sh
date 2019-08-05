#! /bin/bash
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

echo;
echo Checking JDK version:
javac -version
if [ $? != 0 ]; then
  echo Java JDK not found!! Please verify Java JDK installation before continuing...;
  exit 1;
fi

echo;
echo Checking Gradle version:
gradle -version
if [ $? != 0 ]; then
  echo Gradle not found!! Please verify Gradle installation before continuing...;
  exit 1;
fi

echo;
echo Checking NPM version:
npm -version
if [ $? != 0 ]; then
  echo NPM not found!! Please verify NPM installation before continuing...;
  exit 1;
fi

echo;
echo Checking Angular CLI version:
ng -version
if [ $? != 0 ]; then
  echo Angular CLI not found!! Please verify Angular CLI installation before continuing...;
  exit 1;
fi
