#! /bin/bash

pushd install > /dev/null;
./deploy-configmaps.sh
./deploy-ingress.sh
popd > /dev/null;

pushd .. > /dev/null;
echo;
echo Starting elk stack;
pushd docker-elk > /dev/null;
make run;
popd > /dev/null;

echo;
echo Starting postgres;
pushd person-svc > /dev/null;
make run-postgres
popd > /dev/null;

while [ -n "`kube get pods | grep postgres | grep Running`" ] ; do
  sleep 10;
done

echo Configuring postgres;
./setup_db.sh

echo;
echo Starting services;
./start_all.sh

popd > /dev/null;
